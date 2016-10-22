class User < ApplicationRecord
	before_save { self.email = self.email.downcase } #downcases email upon saving to db
	
	#Check for presence and length on name field
	validates :name,  
						presence: true, 
						length: { maximum: 50 } #Checks name field for input
	
	#Create regex for email verification
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  #check for presence, length, email validity, and uniqueness (While ignoring case) on email field
  validates :email, 
  					presence: true, 
  					length: { maximum: 255 }, 
  					format: { with: EMAIL_REGEX },
  					uniqueness: { case_sensitive: false }
  					
  has_secure_password	#Method adds a secure password to the model. Must add attribute called password_digest to db
  
  #Checks that password is present and is no less than 6 in length and no more than 50
  validates :password, 
  					presence: true, 
  					length: { minimum: 6, maximum: 50 }
end
