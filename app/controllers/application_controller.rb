class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def redirect_login
    if @current_user.blank? or @current_user.nil?
      redirect_to login_sessions_path, notice: { status: false, title: "Access denied", content: "You must be logged in to access this page" }
    end
  end
end
