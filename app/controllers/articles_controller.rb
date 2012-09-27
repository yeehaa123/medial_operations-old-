class ArticlesController < ApplicationController
  def index
    @articles = ArticleDecorator.all
  end

  def show
    @article = ArticleDecorator.find(params[:id])
    @references = @article.references
  end
end
