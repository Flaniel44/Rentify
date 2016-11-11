#Author: Daniel Spagnuolo
#Date: November 10th
#Class provides a way to change db structure
class CreateUsers < ActiveRecord::Migration[5.0]
  
  #creates a users table with two columns, name and email
  def change
    #create table called users with name and email columns of type string
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps #column for creation timestamp
    end
  end
end
