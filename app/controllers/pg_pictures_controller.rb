class PgPicturesController < ApplicationController
  before_filter :find_playground
  
  def new
    @pg_picture = @playground.pg_pictures.new
  end
  
  def create
    @pg_picture = @playground.pg_pictures.new(params[:pg_picture])
    

    
    if @pg_picture.save
      
      flash[:notice] = "Picture was uploaded"
      logger.debug "XXX checking if #{@playground.name} has an address"
      if(not @playground.address.length > 0)
        logger.debug "XXX about to set the address"
        @playground.set_playground_location(@pg_picture.latitude, @pg_picture.longitude, @pg_picture.place)
      end
      redirect_to @playground
    else
      flash[:notice] = "Picture was not successfully uploaded"
      redirect_to @playground
    end
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
