class Cart < ActiveRecord::Base
  has_many :items, class_name: 'CartItem', dependent: :destroy
  has_many :books, through: :items
  
  
  def has?(book)
    self.items.to_a.find{|item| item.book_id == book.id }.nil? ? false : true
  end
  
  def size
    self.items.inject(0){|result, item|  result + item.quantity }
  end
  
  def price
    self.items.inject(0){|result, item| result + item.book.price * item.quantity }
  end
end
