class UsersController < ApplicationController
  include ApplicationHelper
  before_action :find_user, only: [:edit, :update, :show] 
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.profile_image = gravatar_link(user_params[:email])
    res = user.save
    if (res)
      session[:user_id] = user.id
      flash[:notice]  = "Hello #{user.username}, Welcome to AlphaBlog."
      redirect_to articles_path
    else
      @user = user
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