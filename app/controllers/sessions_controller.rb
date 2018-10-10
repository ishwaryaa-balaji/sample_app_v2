class SessionsController < ApplicationController

  def new
  end
  def create     
    user = User.where(email: params[:session][:email].downcase).first
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to static_pages_home_path
      cookies[:user_email] = user.email
    else
    flash[:error] = 'Invalid email/password combination' 
    render 'new'
    end
  end
  def destroy
    log_out
    cookies.delete :user_email
    redirect_to static_pages_webpage_path
  end
end