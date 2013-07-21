class SessionsController < ApplicationController
  skip_before_filter :authenticate, :only => [:new, :create, :destroy]

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to Course.active, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end