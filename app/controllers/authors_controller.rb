class AuthorsController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @authors = @course.authors.uniq
  end

  def show
    @course = Course.find(params[:course_id])
    @author = @course.authors.find(params[:id])
    @references = @author.references.uniq
  end
end
