class ReferencesController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @references = @course.references.uniq
  end

  def show
    @reference = Reference.find(params[:id])
  end
end
