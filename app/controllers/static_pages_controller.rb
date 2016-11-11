#Author: Daniel Spagnuolo
#Date: November 10th
#This controller is used for displaying the homepage of the application
class StaticPagesController < ApplicationController
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #Displays Listings on homepage. Uses paginate gem for restricting listings results
  #into pages
  def home
    #check that user is logged in
    if logged_in?
      #if user is logged in, get all listings that don't belong to the current user
      @static_pages = Listing.paginate(page: params[:page]).where.not(user_id: current_user.id)
    else 
      #otherwise if nobody is logged in, get all listings
      @static_pages = Listing.paginate(page: params[:page])
    end
    @date = Time.now.strftime("%d/%m/%Y %H:%M")
  end

  # unused until help page is implemented
  def help
  end
end
