class CreateBooksCategories < ActiveRecord::Migration
  def change
    create_table :books_categories, id: false do |t|
      t.integer :book_id, null: false
      t.integer :category_id, null: false
    end
    
    add_index :books_categories, :book_id
    add_index :books_categories, :category_id
  end
end
