class CoursesController < ApplicationController
  expose(:course)   { CourseDecorator.find(params[:id]) }
  expose(:courses)  { CourseDecorator.decorate(Course.all) }

  def index
  end

  def show
  end
end