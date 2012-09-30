class ReferencesController < ApplicationController
  def index
    @references = ReferenceDecorator.all
  end

  def show
    @reference = ReferenceDecorator.find(params[:id])
  end
end