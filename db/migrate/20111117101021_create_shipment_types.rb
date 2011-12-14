class CreateShipmentTypes < ActiveRecord::Migration
  def change
    create_table :shipment_types do |t|
      t.string :name
    end
    add_index :shipment_types, :name, unique: true
  end
end
