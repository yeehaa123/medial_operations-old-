class ReferencesController < ApplicationController
  def index
    @references = ReferenceDecorator.decorate(Reference.all)
  end

  def show
    @reference = ReferenceDecorator.find(params[:id])
  end
end