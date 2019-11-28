class NotificationMailer < ActionMailer::Base
  default :from     => "noreply@capsf.org"
  default :to       => "sitemaster@capsf.org"
  
  def new_message(message)
    @message = message
    mail(:subject => "Cap SF Contact Inquiry",
         :cc      => message.email,
         :to      => "sitemaster@capsf.org"
        )
  end

end


