#Class provides a way to change db structure
class CreateUsers < ActiveRecord::Migration[5.0]
  
  #creates a users table with two columns, name and email
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
