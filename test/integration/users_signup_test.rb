require 'test_helper'

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
    assert_template 'users/new' #checks to see if user is re-shown the signup page
  end
end
