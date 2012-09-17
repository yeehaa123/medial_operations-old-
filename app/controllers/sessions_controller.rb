class SessionsController < ApplicationController
  def index
    @sessions = SessionDecorator.all
  end

  def show
    @session = SessionDecorator.find(params[:id])
  end
end
