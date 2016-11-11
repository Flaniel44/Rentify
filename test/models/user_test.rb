#Author: Daniel Spagnuolo
#Date: November 10th
#Tests the user model for validation errors 
require 'test_helper' # sets up fixtures (none being used here)

class UserTest < ActiveSupport::TestCase
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #Sets up a valid User object for use in test cases
  def setup
    # has_secure_password method in user model enforces the use of password confirmation
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  #Author: Daniel Spagnuolo
  #Date: November 10th
  #Tests for user validity based on test object
  test "should be valid" do
    assert @user.valid? #returns false if user is not fit based on model specs
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #Empty name should be invalid
  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #Empty email should be invalid
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #name should be less than 51 characters
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  #Author: Daniel Spagnuolo
  #Date: November 10th
  #email should be less than 256 characters
  test "email should not be too long" do
    @user.email = "a" * 245 + "@sample.com"
    assert_not @user.valid?
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #email needs to be properly formed. testing well formed emails
  test "email validation should accept valid addresses" do
    #creates array of sample valid emails
    valid_addresses = %w[name@hotmail.com BOB@gmail.COM john_SMITH@gc.ga.ca john.doe@yahoo.ca john+jen@outlook.bz]   
    #For each email, assign the email to the user and check for validity.
    valid_addresses.each do |valid_address| 
      @user.email = valid_address
      assert @user.valid?
    end
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #email needs to be properly formed. testing poorly formed emails
  test "email validation should reject invalid addresses" do
    #creates array of sample invalid emails
    invalid_addresses = %w[name@hotmail,com john.org johnSmith@hotmail.com@gmail.com jen@gmail+hotmail.com]
    #For each email, assign the email to the user and check for validity.
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?
    end
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #Test for two emails with the same email
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.downcase   #ignores duplicates with different casing
    @user.save
    assert_not duplicate_user.valid?
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #test that emails are saved as lower-case
  test "email addresses should be saved as lower-case" do
    mixed_case_email = "HelLo@gMAIL.cOm"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email # Check that the two are equal
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #tests that the user is invalid if password is blank
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #tests that the user is invalid if password is less than 5 in length
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #tests that the user is invalid if password is more than 50 in length
  test "password should have a maximum length" do
    @user.password = @user.password_confirmation = "a" * 51
    assert_not @user.valid?
  end
  
  #Author: Daniel Spagnuolo
  #Date: November 10th
  #checks that listings associated with a user are destroyed
  test "associated listings should be destroyed" do
    @user.save
    @user.listings.create!(title: "Screwdriver for 1 week", category: "Tool", 
                          postalcode: "K2G8Y9", price: "12", 
                          duration: "1 week")
    assert_difference 'Listing.count', -1 do
      @user.destroy
    end
  end
  
  
end
