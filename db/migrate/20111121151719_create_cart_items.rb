class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :cart_id, null: false
      t.integer :book_id, null: false
      t.integer :quantity, null: false
    end
    
    add_index :cart_items, :cart_id
    add_index :cart_items, :book_id
  end
end
