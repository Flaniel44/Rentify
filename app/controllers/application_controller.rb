#Author: Daniel Spagnuolo
#Date: November 10th
#This is the original Application controller, which effectivel
#has no use since we have moved to the static_pages_controller as the homepage
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper #allows the functions in sessionsHelper to be used anywhere
  
  #Author: Daniel Spagnuolo
  #Date: november 10th
  #Old homepage. This has since been changed via routes.rb
  def hello
    #print text to view
    render html: "hello, world!"
  end
end
