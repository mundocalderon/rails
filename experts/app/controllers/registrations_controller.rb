class RegistrationsController < Devise::RegistrationsController
  layout 'external'
  
  def new
    @user = User.new
    render :layout => 'external'
  end


end
