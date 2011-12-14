class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :region_id
      t.string :postcode
      t.string :place
      t.string :address
      t.string :receiver_name
      t.boolean :sent

      t.timestamps
    end
    add_index :orders, :user_id
  end
end
