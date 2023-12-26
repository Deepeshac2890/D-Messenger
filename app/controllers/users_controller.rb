class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    res = User.create(user_params)
    if (res)
      flash[:notice]  = "Hello #{res.username}, Welcome to AlphaBlog."
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end