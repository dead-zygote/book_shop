require 'spec_helper'

describe Order do
  before do
    @book = Factory :book
    @user = Factory :user
    @address = Factory :address, user: @user
    @order = @user.orders.create!(delivery_address: @address)
    @order.items.create!(book: @book, price: @book.price, quantity: 1)
  end
  
  it "should be able to change its state from paid to ready if there is enough books" do
    @order.state = 'paid'
    @order.save
    @book.update_attributes(quantity: 999)
    @order.state = 'ready'
    @order.save.should be_true
  end
  
  it "should not be able to change its state from paid to ready if there is not enough books" do
    @order.state = 'paid'
    @order.save
    @book.update_attributes(quantity: 0)
    @order.state = 'ready'
    @order.save.should_not be_true
  end
  
  [:region, :postcode, :place, :address, :receiver_name].each do |field|
    it "should have #{field}" do
      @order.send("#{field}=", nil)
      @order.should_not be_valid
    end
  end
  
  describe "delivery_address" do
    before do
      @new_order = Order.new
      @new_order.delivery_address = @address
    end
    
    it "should set region" do
      @new_order.region_id.should == @address.region_id
    end
    
    it "should set postcode" do
      @new_order.postcode.should == @address.postcode
    end
    
    it "should set place" do
      @new_order.place.should == @address.place
    end
    
    it "should set address" do
      @new_order.address.should == @address.address
    end
    
    it "should set receiver_name" do
      @new_order.receiver_name.should == @address.receiver_name
    end
  end
end
