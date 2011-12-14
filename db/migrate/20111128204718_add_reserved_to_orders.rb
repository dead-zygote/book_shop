class AddReservedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :reserved, :boolean, null: false, default: false
  end
end
