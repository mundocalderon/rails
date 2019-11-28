class SessionsController < Devise::SessionsController


  def create
    if has_user_role
      if super
        set_flash_message :notice, :signed_in
      else
        set_flash_message :notice, :invalid
      end
    else
      redirect_to root_url 
      set_flash_message :notice, :invalid
    end
  end
end
