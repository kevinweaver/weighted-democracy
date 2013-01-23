class SessionsController < ApplicationController
  skip_before_filter :authenticate
  layout 'sessions'

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    reset_session 
    redirect_to login_path
  end
end
