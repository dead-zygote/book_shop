class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.text :description
      t.string :isbn
      t.integer :year
      t.integer :pages_count
      t.integer :printed_copies_count
      t.integer :publisher_id
      t.integer :cover_type_id
      t.string :sizes
      t.integer :weight
      t.string :image
      t.decimal :price, precision: 8, scale: 2, null: false
      t.integer :quantity, null: false, default: 1
      t.boolean :available, null: false, default: false

      t.timestamps
    end
    
    add_index :books, :isbn, unique: true
  end
end
