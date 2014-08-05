class ApplicationController < ActionController::Base
  helper_method :current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_sign_in
    unless current_user
      flash[:error] = "need log in to do that"
      redirect_to root_path
    end
  end

  def logged_in?
    session[:user_id] != nil
  end
end
