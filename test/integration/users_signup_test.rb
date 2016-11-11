#Author: Daniel Spagnuolo
#Date: November 10th
#tests that users will not be created when invalid info is given
require 'test_helper'  # sets up fixtures (not being used in this test)

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  #Tests invalid user signup
  test "invalid signup information" do
    get signup_path #loads signup page
    assert_no_difference 'User.count' do      #checks to see if number of users stayed the same
    
      #posts info to create action (mapped by routes.rb)
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "fo" } }
    end
    assert_template 'users/new' #checks to see if user sign up is re-shown 
    #after the signup page
  end
end
