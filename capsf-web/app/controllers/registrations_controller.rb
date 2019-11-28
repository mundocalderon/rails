class RegistrationsController < Devise::RegistrationsController

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
        UserRegistrationMailer.delay.new_user(resource)
        set_flash_message :notice, :signed_up_but_inactive
      else
        flash.now.notice = "Sorry, there were errors with your submission. Please try again."
        render :new
      end
    end
  end

end
