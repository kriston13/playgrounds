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

  def edit
    @playground = Playground.find(params[:id])
  end
  
  def update
    @playground = Playground.find(params[:id])
    if @playground.update_attributes(params[:playground])
      redirect_to @playground
    else
      flash[:notice] = "Errors prevented this from being updated"
      redirect_to @playground
    end
  end
  
  def show
    @playground = Playground.find(params[:id])
    @pg_pix = @playground.pg_pictures.all
  end
  


  protected

end
