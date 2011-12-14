class AddStateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :state, :string, limit: 6, null: false, default: 'unpaid'
  end
end
