class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id, null: false
      t.integer :region_id, null: false
      t.string :postcode, null: false
      t.string :place, null: false
      t.string :address, null: false
      t.string :receiver_name, null: false

      t.timestamps
    end
    
    add_index :addresses, :user_id
  end
end
