class NotificationMailer < ActionMailer::Base
  default :from     => "noreply@capsf.org"
  default :to       => "rcalderon@capsf.org"
  
  def new_message(message)
    @message = message
    mail(:subject => "CAPSF Contact Inquiry",
         :cc      => message.email,
         :to      => "rcalderon@capsf.org"
        )
  end

end


