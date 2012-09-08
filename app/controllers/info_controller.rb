class InfoController < ApplicationController
  def home
  	@courses = Course.all
  end

	def syllabus
  	@course = Course.first
  end
end