class AuthorsController < ApplicationController
  expose(:authors) { Author.all }
  expose(:author)
  expose(:references) { ReferenceDecorator.decorate(author.references) }

  def index
  end

  def show
  end
end