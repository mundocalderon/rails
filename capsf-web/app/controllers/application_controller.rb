class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  #include ActionView::Helpers::TextHelper
  layout :variable_layout
  helper :all
  protect_from_forgery
  helper_method :logged_user_session, :logged_user, :has_admin_role, :has_user_role, :has_super_admin_role
  before_filter :store_location


  #rescue_from ActiveRecord::RecordNotFound, :with => :route_404
  #rescue_from ActiveRecord::RoutingError, :with => :route_404


  private
  
  def variable_layout
    if current_user.nil?
      "external"
    else
      "application"
    end
  end

  def route_404(exception = nil)
    if exception
      logger.info "Rendering 404 with exception: #{exception.message}"
    end

    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404.html", :status => :not_found, :layout => false }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end
  
  def logged_user
    @logged_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def has_user_role
    if current_user && !current_user.role.nil? 
      return true
    else
      flash[:notice] = "You must be a User to access this page"
      logger.info "Sitemaster needs to give you access."
      redirect_to root_path
      return false
    end
  end

  def has_admin_role
    if current_user && (current_user.role.eql?("Admin") || current_user.role.eql?("SuperAdmin"))
      return true
    else
      flash[:notice] = "You must be an Admin."
      redirect_to root_path
      return false
    end
  end

  def has_super_admin_role
    if current_user && current_user.role.eql?("SuperAdmin")
      return true
    else
      flash[:notice] = "You must be a Super Admin."
      redirect_to root_path
      return false
    end
  end

  def require_no_user
    if logged_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to root_path
      return false
    end
  end

  def store_location
    if (!request.fullpath.match("/users") &&
     !request.xhr?) # don't store ajax calls
     session[:previous_url] = request.fullpath
    end

  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def get_ip
    @request_ip = request.env['REMOTE_ADDR']
  end

  def local_user?
    first_byte,second_byte,third_byte,fourth_byte = request.env['REMOTE_ADDR'].split('.')
    if first_byte == '192' || first_byte == '10' || first_byte == '127'
      return true
    else
      route_404
    end
  end
  
  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

end

