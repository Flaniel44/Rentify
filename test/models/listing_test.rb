require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  def setup
    @user = users(:daniel)
    # build returns an object in memory but doesn’t modify the database
    @listing = @user.listing.build(title: "Bike for 2 weeks", category: "Bike", 
                          postalcode: "K2G8Y9", price: "10.99", 
                          duration: "2 weeks")
  end

  test "should be valid" do
    assert @listing.valid?
  end

  test "user id should be present" do
    @listing.user_id = nil
    assert_not @listing.valid?
  end
  
  test "price should be present" do
    @listing.price = nil
    assert_not @listing.valid?
  end
  
  test "title should be present" do
    @listing.title = "   "
    assert_not @listing.valid?
  end

  test "title should be at most 50 characters" do
    @listing.title = "a" * 51
    assert_not @listing.valid?
  end
  

end
