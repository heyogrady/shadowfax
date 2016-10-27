if defined? GNTP
  GNTP.class_eval do

    def register(params)
      @notifications = params[:notifications]
      @app_icon = params[:app_icon]

      raise TooFewParametersError, "Need least one 'notification' for register" unless @notifications

      @binaries = []

      message = register_header(@app_name, @app_icon)
      message << output_origin_headers

      message << "Notifications-Count: #{@notifications.size}\r\n"
      message << "\r\n"

      @notifications.each do |notification|
        name      = notification[:name]
        disp_name = notification[:disp_name] || name
        enabled   = notification[:enabled] || true
        icon      = notification[:icon]

        message << "Notification-Name: #{name}\r\n"
        message << "Notification-Display-Name: #{disp_name}\r\n"
        message << "Notification-Enabled: #{enabled ? 'True' : 'False'}\r\n"
        message << "#{handle_icon(icon, 'Notification')}\r\n"    if icon
        message << "\r\n"
      end

      @binaries.each {|binary|
        message << output_binary(binary)
        message << "\r\n"
      }


      unless (ret = send_and_recieve(message))
        # raise "Register failed"
      end
    end

    def notify(params, &callback)
      name   = params[:name]
      title  = params[:title]
      text   = params[:text]
      icon   = params[:icon] || get_notification_icon(name)
      sticky = params[:sticky]
      callback_context = params[:callback_context]
      callback_context_type = params[:callback_context_type]

      raise TooFewParametersError, "Notification need 'name', 'title' parameters" unless name || title

      @binaries = []

      message = notify_header(app_name, name, title, text, sticky, icon)
      message << output_origin_headers
      if callback || callback_context
        message << "Notification-Callback-Context: #{callback_context || '(none)'}\r\n"
        message << "Notification-Callback-Context-Type: #{callback_context_type || '(none)'}\r\n"
      end

      @binaries.each {|binary|
        message << output_binary(binary)
      }

      message << "\r\n"

      unless (ret = send_and_recieve(message, callback))
        # raise "Notify failed"
      end
    end

    private

    def send_and_recieve(msg, callback=nil)
      print msg if $DEBUG

      begin
        sock = TCPSocket.open(@target_host, @target_port)
        sock.write msg

        ret = nil
        while rcv = sock.gets
          break if rcv == "\r\n"
          print ">#{rcv}" if $DEBUG
          ret = $1 if /GNTP\/1.0\s+-(\S+)/ =~ rcv
        end

        if callback
          Thread.new do
            response = {}
            while rcv = sock.gets
              break if rcv == "\r\n"
              print ">>#{rcv}" if $DEBUG
              response[:callback_result] = $1 if /Notification-Callback-Result:\s+(\S*)\r\n/ =~ rcv
              response[:callback_context] = $1 if /Notification-Callback-Context:\s+(\S*)\r\n/ =~ rcv
              response[:callback_context_type] = $1 if /Notification-Callback-Context-Type:\s+(\S*)\r\n/ =~ rcv
            end
            callback.call(response)
            sock.close
          end
          return true
        end

        sock.close
        return "OK" == ret
      rescue Exception => _e
      end
    end

  end
end
