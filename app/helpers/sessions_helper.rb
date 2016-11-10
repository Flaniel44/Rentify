module SessionsHelper
	# Logs in user. Sets session variable to the id of parameter User
  def log_in(user)
    session[:user_id] = user.id #automatically encrypted 
  end
  
  #Returns current user if one is logged in
  def current_user
    @current_user = @current_user || User.find_by(id: session[:user_id])
  end
  
   # Checks to see if a user is logged in, returns true or false
  def logged_in?
    !current_user.nil?
  end
  
  #Clears user from session
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
