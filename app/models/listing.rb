class Listing < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :category, presence: true
  validates :postalcode, presence: true, length: { maximum: 6 }
  validates :price, presence: true
  validates :duration, presence: true
end
