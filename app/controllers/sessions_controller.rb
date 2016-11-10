class SessionsController < ApplicationController
  def new
  end
  def create
    @error = "" #init error message
    #Finding user using the posted params from the login form
    user = User.find_by(email: params[:session][:email].downcase) 
    #if the password is correct
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in(user) #found in sessionsHelper. Sets session variable
      redirect_to user #rails converts this to the route for that specific user
    else
      #display error, re-render page
      @error = "<b>Incorrect email and/or password.</b>".html_safe
      render 'new'
    end
  end

  def destroy
    log_out #calls logout from sessionHelper. Clears session variable
    redirect_to root_url  #redirect to root of website
  end
end
