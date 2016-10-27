insert_into_file "app/assets/javascripts/application.js", :after => /jquery_ujs\n/ do
  <<-JS.strip_heredoc
    //= require bootstrap-sprockets
  JS
end
