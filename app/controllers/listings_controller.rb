class ListingsController < ApplicationController
  def show
    @listing = Listing.find(params[:id])
  end
  def new
    @listing = Listing.new
  end
  
  def create
    #gets parameters and assigns to a new listing object for the current user
    @listing = current_user.listings.build(params.require(:listing).permit(:title, :category, :postalcode,
                                   :price, :duration))  
      
                                  
    #If listing is able to save to db              
    if @listing.save
      redirect_to user_url(current_user) #rails converts this to url for that specific user
    else
      #re-render new page, will have errors this time
      render 'new'
    end
  end
end
