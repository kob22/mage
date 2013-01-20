class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize, :authorize_owner
  private

  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end

  helper_method :current_user

  def current_admin_user
    current_user
    unless current_user.admin?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end

  helper_method :current_admin_user


  def destroy_admin_user_session_path
    logout_path
  end

  helper_method :destroy_admin_user_session_path

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end


  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def current_resource
    nil
  end

  def current_background
    nil
  end

  def authorize_owner
    if !current_permission.allow?(params[:controller], params[:action], current_resource)
      redirect_to root_url, alert: "Not authorized."
    end
  end

end
