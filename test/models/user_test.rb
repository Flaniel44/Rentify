require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  #Sets up a valid User object for use in test cases
  def setup
    # has_secure_password method in user model enforces validation on password and password_confirmation
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  #Tests for user validity
  test "should be valid" do
    assert @user.valid?
  end
  
  #Empty name should be invalid
  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end
  
  #Empty email should be invalid
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  
  #name should be less than 51 characters
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  #email should be less than 256 characters
  test "email should not be too long" do
    @user.email = "a" * 245 + "@sample.com"
    assert_not @user.valid?
  end
  
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
  
  #Test for two emails with the same email
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.downcase   #ignores duplicates with different casing
    @user.save
    assert_not duplicate_user.valid?
  end
  
  #test that emails are saved as lower-case
  test "email addresses should be saved as lower-case" do
    mixed_case_email = "HelLo@gMAIL.cOm"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email # Check that the two are equal
  end
  
  #tests that the user is invalid if password is blank
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
  
  #tests that the user is invalid if password is less than 5 in length
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  
  #tests that the user is invalid if password is more than 50 in length
  test "password should have a maximum length" do
    @user.password = @user.password_confirmation = "a" * 51
    assert_not @user.valid?
  end
  
  
end
