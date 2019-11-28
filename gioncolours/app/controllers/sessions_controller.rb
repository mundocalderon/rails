class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_username(params[:sessions][:username])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged In!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
  
end
