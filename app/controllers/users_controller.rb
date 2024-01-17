class UsersController < ApplicationController
  include ApplicationHelper
  before_action :find_user, only: [:edit, :update, :show, :destroy] 
  before_action :require_login, except: [:show, :index, :create, :new]
  before_action :same_user_required, only: [:edit, :update] 

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
    @users = User.paginate(page: params[:page], per_page: 6)
  end

  def destroy
    is_same_user_logged_in = @user == current_user
    user_status = @user.destroy
    if user_status
      flash[:alert] = "User has been deleted"
      if is_same_user_logged_in
        session[:user_id] = nil
        redirect_to root_path
      else
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:alert] = "Something bad happened. Please retry the action."
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def same_user_required
    if @user != current_user
      flash[:alert] = "You are not authorised to do this action."
      redirect_to root_path
    end
  end
end