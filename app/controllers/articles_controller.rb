class ArticlesController < ApplicationController
  def index
    @articles = ArticleDecorator.all
  end

  def show
    @article = ArticleDecorator.find(params[:id])
  end
end
