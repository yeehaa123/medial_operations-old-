class ArticlesController < ApplicationController
  expose(:article)    { ArticleDecorator.find(params[:id]) }
  expose(:articles)   { ArticleDecorator.decorate(Article.all) }
  expose(:references) { article.references }
  
  def index
  end

  def show
  end
end