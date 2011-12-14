# coding: utf-8
class BookQuantityValidator < ActiveModel::Validator
  def validate(record)
    if record.quantity > record.book.quantity
      record.errors[:quantity] << '— нет товара в таком количестве'
    end
  end
end
