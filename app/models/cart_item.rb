class CartItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :cart
  
  validates_numericality_of :quantity, greater_than: 0,
                            only_integer: true
  
  validates_with BookQuantityValidator
end
