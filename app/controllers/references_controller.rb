class ReferencesController < ApplicationController
  expose(:reference)  { ReferenceDecorator.find(params[:id]) }
  expose(:references) { ReferenceDecorator.decorate(Reference.all) }

  def index
  end

  def show
  end
end