class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.text :title
      t.text :category
      t.text :postalcode
      t.references :user, foreign_key: true
      t.float :price
      t.text :duration
      
      t.timestamps
    end
    add_index :listings, [:user_id, :created_at]
  end
end