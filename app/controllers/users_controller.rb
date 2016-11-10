class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  before_action :correct_user, only: [:show]

  #Define user object when viewing a specific users page
  def show
    @user = User.find(params[:id])
    @listings = @user.listings
  end
  
  #Creates a new user object for holding submission form data
  def new
    @user = User.new
  end
  
  #Handles post method
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
  
  #Creates log file if one hasnt been created yet, otherwise grabs existing logfile
  def my_logger
    @@my_logger ||= Logger.new("#{Rails.root}/log/user.log")
  end
  
   # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      redirect_to login_url
    end
  end
  
  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
  
end
