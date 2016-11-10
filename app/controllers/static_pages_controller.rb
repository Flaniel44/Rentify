class StaticPagesController < ApplicationController
  #Stores time for use on homepage
  def home
    if logged_in?
      @static_pages = Listing.paginate(page: params[:page]).where.not(user_id: current_user.id)
    else 
      @static_pages = Listing.paginate(page: params[:page])
    end
    @date = Time.now.strftime("%d/%m/%Y %H:%M")
  end

  # unused until help page is implemented
  def help
  end
end
