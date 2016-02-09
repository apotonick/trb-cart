class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_current_user

  def current_user
    @current_user ||= User.first
  end

  private

  def require_current_user
    redirect_to(users_sign_in_url) && return if current_user.nil? && controller_name != 'Users'
  end

end
