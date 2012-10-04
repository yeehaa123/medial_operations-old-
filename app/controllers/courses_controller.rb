class CoursesController < ApplicationController
  expose(:course)   { CourseDecorator.find(params[:id]) }
  expose(:courses)  { CourseDecorator.decorate(Course.all) }
  # expose(:introduction) do
  #     SessionDecorator.decorate(Session.find_by_number(1))
  #   end

  def index
  end

  def show
  end
end