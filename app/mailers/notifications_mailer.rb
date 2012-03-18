class NotificationsMailer < ActionMailer::Base
  default from: "noreply@yourdomain.dev"
  default to: "alvar.hanso@laposte.net"
  
  def new_message(message)
    @message = message
    mail(:subject => "#{message.subject}")
  end
end
