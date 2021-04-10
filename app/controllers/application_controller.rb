class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  before_action :require_login

  def require_login
    return if logged_in?

    flash[:error] = "You must be logged in to access this section"
    redirect_to login_url # halts request cycle
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def admin?
    current_user.admin?
  end
end
