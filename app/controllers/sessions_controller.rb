class SessionsController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @sessions = SessionDecorator.all
  end

  def show
    @course = Course.find(params[:course_id])
    @session = SessionDecorator.find(params[:id])
  end
end