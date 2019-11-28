class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  helper_method :has_admin_role, :check_admin_role
 
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  
  def after_sign_in_path_for(resource_or_scope)
    people_path
  end
  
  private
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
    
    def check_admin_role
      if current_user.role.eql?("Admin")
        return true
      else
        return false
      end
    end
    
    def has_admin_role
      if current_user.role.eql?("Admin")
        return true
      else
        flash[:notice] = "You must be an admin to access this page"
        redirect_to :back
        return false
      end
    end

    def store_location
      session[:return_to] = request.fullpath
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end
