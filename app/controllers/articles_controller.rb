class ArticlesController < ApplicationController 
    def index 
        @articles = Article.all
    end

    def show
        @article = Article.find_by(id: params[:id])
    end

    def new 
        @article = Article.new()
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
            flash[:notice] = "Articcle was created successfully."
            redirect_to @article
        else
            render 'new'
        end
    end
end