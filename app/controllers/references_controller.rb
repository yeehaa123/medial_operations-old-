class ReferencesController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @references = References.all.uniq
  end

  def show
    @reference = Reference.find(params[:id])
  end
end
