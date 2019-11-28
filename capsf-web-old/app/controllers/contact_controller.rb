class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    
    if  @message.valid? &&  verify_recaptcha( :private_key => '6LcZ8dMSAAAAAGZKqdjYuIRnnMt2lRXvFsDhbJEx')
      NotificationMailer.delay.new_message(@message)
      redirect_to(root_path, :notice => "Message was successfully sent.")
    else
      flash.now.alert = "Please fill all fields."
      flash.delete :recaptcha_error
      render :new
    end
  end

end
