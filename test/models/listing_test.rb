#Author: Daniel Spagnuolo
#Date: November 10th
#Tests the listing model for validation errors 
require 'test_helper'  # sets up fixtures

class ListingTest < ActiveSupport::TestCase
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #sets up a user with a listing for testing
  def setup
    @user = users(:daniel) #Use the sample Daniel - User found in the users fixture
    # build returns an object in memory but doesn’t modify the database
    @listing = @user.listing.build(title: "Bike for 2 weeks", category: "Bike", 
                          postalcode: "K2G8Y9", price: "10.99", 
                          duration: "2 weeks")
  end

  #Author: Daniel Spagnuolo
  #Date: November 10th
  #expecting the listing to be valid
  test "should be valid" do
    assert @listing.valid?
  end

  #Author: Daniel Spagnuolo
  #Date: November 10th
  #listing should no longer be valid since user ID is required
  test "user id should be present" do
    @listing.user_id = nil
    assert_not @listing.valid?
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #listing should no longer be valid since price is required
  test "price should be present" do
    @listing.price = nil
    assert_not @listing.valid?
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #listing should no longer be valid since title is required
  test "title should be present" do
    @listing.title = "   "
    assert_not @listing.valid?
  end

  #Author: Daniel Spagnuolo
  #Date: November 10th
  #listing should no longer be valid since title is limited to 50 characters
  test "title should be at most 50 characters" do
    @listing.title = "a" * 51
    assert_not @listing.valid?
  end
  

end
