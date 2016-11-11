class Listing < ApplicationRecord
  #Author: Daniel Spagnuolo
  #Date: November 10th 2016
  #Purpose: Defines validations on models fields when submitting to database
  
  belongs_to :user # many to many relationship with users
  validates :user_id, presence: true 
  validates :title, presence: true, length: { maximum: 50 }
  validates :category, presence: true
  validates :postalcode, presence: true, length: { maximum: 6 }
  validates :price, presence: true
  validates :duration, presence: true
end
