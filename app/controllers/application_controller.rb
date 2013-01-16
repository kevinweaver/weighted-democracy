class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate

  def authenticate
    if !session[:user_id]
      redirect_to login_path
    end
  end

end
