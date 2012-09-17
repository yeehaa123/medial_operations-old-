class InfoController < ApplicationController
  def home
  	@courses = Course.all
  end

	def syllabus
  	@course = CourseDecorator.first
  end
end