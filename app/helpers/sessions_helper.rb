#Author: Daniel Spagnuolo
#Date: November 10th
# A helper defines a set of methods that can be used in any View or Controller
module SessionsHelper
  #Author: Daniel Spagnuolo
  #Date: November 10th
	# Logs in user. Sets session variable to the id of parameter User
  def log_in(user)
    session[:user_id] = user.id #automatically encrypted 
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #Returns current user if one is logged in
  def current_user
    @current_user = @current_user || User.find_by(id: session[:user_id])
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
   # Checks to see if a user is logged in, returns true or false
  def logged_in?
    !current_user.nil?
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #Clears user from session
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
