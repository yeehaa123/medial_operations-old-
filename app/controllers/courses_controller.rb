class CoursesController < ApplicationController
  def index
    @courses = CourseDecorator.all
  end

  def show
    @course = CourseDecorator.find(params[:id])
  end
end