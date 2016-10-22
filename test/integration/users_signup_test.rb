require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do      #checks to see if number of users went up by one
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "fo" } }
    end
    assert_template 'users/new' #checks to see if user is shown the signup page
  end
end
