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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end