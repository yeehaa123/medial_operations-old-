class ReferencesController < ApplicationController
  def index
    @references = ReferenceDecorator.all.uniq
  end

  def show
    @reference = ReferenceDecorator.find(params[:id])
  end
end
