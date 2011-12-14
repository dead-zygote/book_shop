class RemoveSentFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :sent
  end
end
