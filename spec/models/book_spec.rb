require 'spec_helper'

describe Book do
  before do
    @book = Factory.build :book
  end
  
  it "should be valid with valid attributes" do
    @book.should be_valid
  end
  
  it "should have title" do
    @book.title = ''
    @book.should_not be_valid
  end
  
  it "should have price" do
    @book.price = nil
    @book.should_not be_valid
  end
  
  it "should have quantity" do
    @book.quantity = nil
    @book.should_not be_valid
  end
  
  it "should not have negative quantity value" do
    @book.quantity = -1
    @book.should_not be_valid
  end
  
  it "should have comma-separated list of author names" do
    @book.author_names = 'one, two, three'
    @book.save
    @book.author_names.should == 'one, two, three'
    @book.authors.count.should == 3
  end
  
  it "should have comma-separated list of category names" do
    @book.category_names = 'one, two'
    @book.save
    @book.category_names.should == 'one, two'
    @book.categories.count.should == 2
  end
  
  it "should be destroyable if it has not orders" do
    @book.destroy.should be_true
  end
  
  it "should not be destroyable if it has orders" do
    user = Factory :user
    address = Factory :address, user: user
    order = user.orders.create!(delivery_address: address)
    order.items.create!(book: @book, price: @book.price, quantity: 1)
    @book.destroy.should_not be_true
  end
end
