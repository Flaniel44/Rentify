class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper #allows the functions in sessionsHelper to be used anywhere
  
  #Old homepage. This has since been changed via routes.rb
  def hello
    #print text to view
    render html: "hello, world!"
  end
end
