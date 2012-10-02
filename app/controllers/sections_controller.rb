class SectionsController < ApplicationController
  expose(:sections) { SectionDecorator.decorate(Section.all) }
  expose(:section)  { SectionDecorator.find(params[:id]) }

  def index
  end

  def show
  end
end
