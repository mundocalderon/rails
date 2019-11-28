class AdminController < ApplicationController
  before_filter :has_super_admin_role
  # GET /admin
  # GET /admin.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end


  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end


  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to profile_path(@user), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_userlist_path }
      format.json { head :no_content }
    end
  end

  # GET /admin
  def links

  end

  def entries_list
     @entries = Entry.unscoped.all
     @search = Entry.unscoped.ransack(params[:q])
     @entries = @search.result(distinct: true)
     @search.build_condition if @search.conditions.empty?
     @search.build_sort if @search.sorts.empty?
     
  end


end

