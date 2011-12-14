class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.integer :order_id
      t.string :postal_identifier
      t.integer :shipment_type_id

      t.datetime :created_at
    end
    add_index :shipments, :order_id
    add_index :shipments, :postal_identifier, unique: true
  end
end
