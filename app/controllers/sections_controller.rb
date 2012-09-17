class SectionsController < ApplicationController
  def index
    @sections = SectionDecorator.all
  end

  def show
    @section = SectionDecorator.find(params[:id])
  end
end
