class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :destroy, :edit, :update]
  def index
    @article = Article.all
  end

  def show; end

  def edit; end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
