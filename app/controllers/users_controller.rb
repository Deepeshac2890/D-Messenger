class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :show] 
  def new
    @user = User.new
  end

  def create
    res = User.create(user_params)
    if (res)
      session[:user_id] = res.id
      flash[:notice]  = "Hello #{res.username}, Welcome to AlphaBlog."
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end