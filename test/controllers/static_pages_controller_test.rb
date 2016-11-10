require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  #Check that the home page loads correctly
  test "should get test" do
    get static_pages_home_url
    assert_response :success
  end

end
