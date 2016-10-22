class UsersController < ApplicationController
  

  
  def show
    @user = User.find(params[:id])
  end
  
  #Creates a new user object and stores in instance variable for view to use
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation))    
    if @user.save
      my_logger.info("Creating user with name #{@user.name}")
      log_in @user
      redirect_to user_url(@user) #rails converts this to url for that specific user
    else
      render 'new'
    end
  end
  
  def my_logger
    @@my_logger ||= Logger.new("#{Rails.root}/log/user.log")
  end
  
end
