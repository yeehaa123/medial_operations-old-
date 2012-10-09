class MeetingsController < ApplicationController
  expose(:course)   { Course.find(params[:course_id]) }
  expose(:meeting)  { MeetingDecorator.decorate(Meetings.find(params[:id])) }
  expose(:meetings) { MeetingDecorator.decorate(Meeting.all) }

  def index
  end

  def show
  end
end