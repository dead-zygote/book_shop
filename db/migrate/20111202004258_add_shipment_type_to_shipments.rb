class AddShipmentTypeToShipments < ActiveRecord::Migration
  def change
    add_column :shipments, :shipment_type, :string
  end
end
