class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper #allows the use of functions defined in sessionsHelper
  
  @test = "tessssst"
  def hello
    render html: "hello, world!"
  end
end
