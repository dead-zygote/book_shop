class Order < ActiveRecord::Base
  attr_accessible :region, :delivery_address_id, :delivery_address, :items_attributes
  
  belongs_to :user
  has_many :items, class_name: 'OrderItem', dependent: :destroy
  has_many :shipments
  belongs_to :region
  has_many :books, through: :items
  
  validates_presence_of :region_id, :user_id, :postcode, :place, :address, :receiver_name
  
  STATES = ['unpaid', 'paid', 'ready', 'sent']
  
  validates_inclusion_of :state, in: STATES
  
  accepts_nested_attributes_for :items

  self.per_page = 50  
  
  def paid?
    self.state == 'paid'
  end
  
  def ready?
    self.state == 'ready'
  end
  
  def sent?
    self.state == 'sent'
  end
  
  def delivery_address=(address)
    if address.nil?
      self.region_id = nil
      self.postcode = nil
      self.place = nil
      self.address = nil
      self.receiver_name = nil
    else
      self.region_id = address.region_id
      self.postcode = address.postcode
      self.place = address.place
      self.address = address.address
      self.receiver_name = address.receiver_name
    end
  end
  
  def delivery_address_id=(id)
    address = Address.find(id)
    self.delivery_address = address
  end

  
  before_save do
    if self.new_record?
      self.items = self.items.delete_if { |item|  not item.chosen }
      price = self.items.inject(0){|result, item| result + item.price}
      self.price = price + price * BigDecimal.new('0.35')
    elsif self.ready? or self.sent?
      self.reserve!
    else
      self.unreserve!
    end
  end
  
  before_destroy do
    self.unreserve! if self.reserved?
  end
  
  def reserve!
    unless self.reserved?
      Book.transaction do
        self.items.each do |item|
          book = item.book
          book.quantity -= item.quantity
          book.save!
        end
        self.reserved = true
      end
    end
    self.reserved
  end
  
  def unreserve!
    if self.reserved?
      Book.transaction do
        self.items.each do |item|
          book = item.book
          book.quantity += item.quantity
          book.save!
        end
        self.reserved = false
      end
    end
    true
  end
end
