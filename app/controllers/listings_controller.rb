#Author: Daniel Spagnuolo
#Date: November 10th
#This controller is used for the creation and displaying of individual listings
class ListingsController < ApplicationController
    
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #The show function finds the Listing object based on the ID of the listing 
  #That the view is trying to display
  def show
    @listing = Listing.find(params[:id])
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #The new function creates an empty Listing object. It is called whenever the
  #listing creation page is shown
  def new
    @listing = Listing.new
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #The create function takes the parameters from POST-ing the form data
  #for a listing. Then the listing is saved to the database.
  def create
    #gets parameters and assigns to a new listing object for the current user
    @listing = current_user.listings.build(params.require(:listing).permit(:title, :category, :postalcode,
                                   :price, :duration))  
      
                                  
    #If listing is able to save to db              
    if @listing.save
      redirect_to user_url(current_user) #Redirect to current users page
    else
      #re-render new page, will have errors this time
      render 'new'
    end
  end
end
