class RegistrationsController < Devise::RegistrationsController
=begin
  def create
    if verify_recaptcha :private_key => '6LcZ8dMSAAAAAGZKqdjYuIRnnMt2lRXvFsDhbJEx', :timeout => 10 
      if super
        UserRegistrationMailer.delay.new_user(@user)
        set_flash_message :notice, :signed_up_but_inactive
      else
        logger.info "**************** #{flash.to_hash} **********"
        logger.info "**************super returns FALSE *********"
        flash[:recaptcha_error] = "test test"
        flash.alert = "This email address already in use. Please contact Administrator for help"
        logger.info "**************** #{flash.to_hash} **********"
      end
    else
      build_resource
      clean_up_passwords(resource)
      flash.now[:notice]= "Recaptcha Solution Failed"
      flash.delete :recaptcha_error
      render :new
    end
  end
=end



  def create
    if !verify_recaptcha :private_key => '6LcZ8dMSAAAAAGZKqdjYuIRnnMt2lRXvFsDhbJEx', :timeout => 10 
      flash.delete :recaptcha_error
      build_resource
      resource.valid?
      resource.errors.add(:base, "there was an error with the recaptcha code")
      flash.now.notice = "Sorry, there were errors with your submission. Please try again."
      clean_up_passwords(resource)
      respond_with_navigational(resource){ render :new }
    else
      flash.delete :recaptcha_error
      if super
        UserRegistrationMailer.delay.new_user(@user)
        set_flash_message :notice, :signed_up_but_inactive
      else
        flash.now.notice = "Sorry, there were errors with your submission. Please try again."
        render :new
      end
    end
  end

end
