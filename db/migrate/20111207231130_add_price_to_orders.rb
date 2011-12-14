class Order < ActiveRecord::Base
  has_many :items, :class_name => 'OrderItem'
end

class OrderItem < ActiveRecord::Base
  belongs_to :order
end

class AddPriceToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :price, :decimal, precision: 8, scale: 2
    
    Order.all.each do |order|
      price = order.items.inject(0){|result, item| result + item.price}
      order.price = price + price * BigDecimal.new('0.35')
      order.save
    end
  end
end
