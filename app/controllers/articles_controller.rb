class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
        # return render json: {
        #     success: true
        # }
    end
end