class ArticlesController < ApplicationController
  
  include ApplicationHelper

    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
        # return render json: {
        #     success: true
        # }
    end

    def home
      redirect_to articles_path if logged_in?
    end

    def new
      @article = Article.new
    end

    def edit
    end

    def create
      @article = Article.new(article_params)
      # This has been added for now till we have authentication system in place
      @article.user = current_user
      @res = @article.save
      if (@res)
        flash[:notice]  = "Article was created successfully."
        redirect_to article_path(@article)
      else
        render 'new'
      end
    end

    def update
      @res = @article.update(article_params)
      if (@res)
        flash[:notice]  = "Article was updated successfully."
        redirect_to article_path(@article)
      else
        render 'edit'
      end
    end

    def destroy
      @res = @article.destroy
      if (@res)
        flash[:notice]  = "Article was deleted successfully."
        redirect_to articles_path
      else
        flash[:notice]  = "Article was not deleted successfully."
      end
    end

    private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end
end