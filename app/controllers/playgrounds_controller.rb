class PlaygroundsController < ApplicationController

  def index
    @playgrounds = Playground.all
  end

  def new
    @playground = Playground.new
  end

  def create
    @playground = Playground.new(params[:playground])
    @playground.save
    flash[:notice] = "Playground has been created"
    redirect_to @playground
  end
  
  def show
    @playground = Playground.find(params[:id])
  end
  
end
