class AuthorsController < ApplicationController
  def index
    @authors = Author.all.uniq
  end

  def show
    @author = Author.find(params[:id])
  end
end