class AuthController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if (user != nil && user.authenticate(params[:session][:password])) 
      flash[:notice] = "Login Successful"
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:alert] = "Invalid Login Credentials"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged Out"
    redirect_to root_path
  end
end