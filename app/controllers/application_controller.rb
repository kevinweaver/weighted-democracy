class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate

  def authenticate
    redirect_to login_path unless session[:user_id]
  end

  helper_method :current_user
  private
  def current_user
    @current_user = User.find_by_id(session[:user_id])
  end

end
