require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  #Check that the signup page loads correctly
  test "should get new" do
    get signup_path
    assert_response :success
  end

end
