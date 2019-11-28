class UsersController < ApplicationController
  layout "admin"
  
  def new
      @user = User.new
    end
  
    def create
      @user = User.new(params[:user])
      if @user.save
        redirect_to root_url, notice: "All signed up!"
      else
        render "new"
      end
    end
end
