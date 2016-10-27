class EmailInterceptor

  def self.delivering_email(message)
    message.to = Rails.application.secrets.intercept_and_forward_emails_to
  end

end

if Rails.application.secrets.intercept_and_forward_emails_to.present?
  ActionMailer::Base.register_interceptor(EmailInterceptor)
end
