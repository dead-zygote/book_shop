# coding: utf-8
class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :book
  
  validates_numericality_of :price, greater_than: 0
  
  validates_numericality_of :quantity, greater_than: 0,
                            only_integer: true
  
  validates_with BookQuantityValidator
  
  
  attr_accessor :chosen
  
  def chosen=(value)
    if value == false or value == '0'
      @chosen = false
    else
      @chosen = true
    end
  end
  
  def possible?
    self.quantity <= self.book.quantity
  end
end
