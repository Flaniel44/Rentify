require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  
  #Check that the login page loads correctly
  test "should get new" do
    get login_path
    assert_response :success
  end

end
