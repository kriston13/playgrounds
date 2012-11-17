class PgPicturesController < ApplicationController
  before_filter :find_playground
  
  def new
    @pg_picture = @playground.pg_pictures.new
  end
  
  def create
    @pg_picture = @playground.pg_pictures.new(params[:pg_picture])
    @pg_picture.save
    flash[:notice] = "Picture has been created"
    redirect_to @playground
  end
  
  def destroy
    @pg_picture = @playground.pg_pictures.find(params[:id])
    @pg_picture.destroy
    flash[:notice] = "Picture has been deleted"
    redirect_to @playground
  end
  
  protected 
    def find_playground
      @playground = Playground.find(params[:playground_id])
    end
  
end
