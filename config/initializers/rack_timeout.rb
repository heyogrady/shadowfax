Rack::Timeout.service_timeout = if Rails.env.staging? || Rails.env.production?
                                  15 # seconds
                                else
                                  false
                                end
