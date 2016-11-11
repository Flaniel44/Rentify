#Author: Daniel Spagnuolo
#Date: November 10th
# updates database to force user email uniqueness
class AddIndexToUsersEmail < ActiveRecord::Migration[5.0]
  #add an index to Users.email column that forces uniqueness
  def change
    add_index :users, :email, unique: true 
  end
end
