class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:errors] = "Invalid Login"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = 'Successfully logged out.'
    redirect_to login_path
  end

end