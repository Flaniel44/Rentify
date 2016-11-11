#Author: Daniel Spagnuolo
#Date: November 10th
#Controller for showing, creating, and checking users
class UsersController < ApplicationController
  # runs these actions before Users show page is loaded
  before_action :logged_in_user, only: [:show]
  before_action :correct_user, only: [:show]

  #Author: Daniel Spagnuolo
  #Date: November 10th
  #Define user object and associated listings when viewing a specific users page
  def show
    @user = User.find(params[:id]) #Finds a user in the db based on it's ID
    @listings = @user.listings
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #re-inits a new user object whenever the creation form is shown
  def new
    @user = User.new
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #Handles User creation form post method
  def create
    #gets parametes and assignes to user object
    @user = User.new(params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation))  
                                   
    #If user is able to save to db              
    if @user.save
      my_logger.info("Creating user with name #{@user.name}")
      #Log the new user in using sessionHelper function
      log_in @user
      redirect_to user_url(@user) #rails converts this to url for that specific user
    else
      #log the error
      my_logger.info("Unable to create user with name #{@user.name}")
      render 'new'
    end
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #Creates log file if one hasnt been created yet, otherwise grabs existing logfile
  def my_logger
    @@my_logger ||= Logger.new("#{Rails.root}/log/user.log")
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  # If the user is not logged in, redirect them to login page
  #this is called when the show action tries to display the page for an
  #individual user
  def logged_in_user
    unless logged_in?
      redirect_to login_url
    end
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  # Checks that the user page trying to be accessed matches the logged in user
  #this is called when the show action tries to display the page for an
  #individual user
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
  
end #end of controller

#Author: Daniel Spagnuolo
#Date: November 10th
#proof of concept for user created inheritance objects
#superclass, defines/sets common object properties
class ObjectItem 
  
  #Class members
  @name = ""
  @userID = 0
  @weight = 0
  @postalCode = ""
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #constructor
  def initialize(name, userID, weight, postalCode)
    @name = name
    @userID = userID
    @weight = weight
    @postalCode = postalCode
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #superclass method, can be called from any subclass to calc distance
  def calcDistance(searchCode)
    return "You are X far away"
  end

end

#Author: Daniel Spagnuolo
#Date: November 10th
#subclass, inherits all properites and methods from superclass
class Bike < ObjectItem
  
  #unique properties
  @colour = ""
  @Type = ""
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #constructor for unique properties
  def initialize(name, userID, weight, postalCode, colour, type)
    
    #Author: Daniel Spagnuolo
    #Date: November 10th
    #initialize superclass
    super(name, userID, weight, postalCode)
    @colour = colour
    @Type = type
  end
end

#Author: Daniel Spagnuolo
#Date: November 10th
#subclass, inherits all properites and methods from superclass
class Tool < ObjectItem
  
  #unique property
  @type = ""
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #constructor for unique properties
  def initialize(name, userID, weight, postalCode, toolType)
     #initialize superclass
    super(name, userID, weight, postalCode)
    @type = toolType
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #action exclusive to tools
  def getToolType
    return @type
  end
end
