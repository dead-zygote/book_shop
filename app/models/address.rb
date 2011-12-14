class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :region
  
  validates_presence_of :region_id, :postcode, :place,
                        :address, :receiver_name
  
  after_save do
    if self.make_default
      self.user.update_attributes(default_address_id: self.id)
    end
  end
  
  public
  
  def make_default
    if @make_default.nil?
      @make_default = self.user.default_address_id == self.id
    else
      @make_default
    end
  end
  
  def make_default=(value)
    @make_default = (['0', false].include? value) ? false : true
  end
  
  def to_s
    "#{self.postcode}; #{self.region.name}, #{self.place}; #{self.address}, #{self.receiver_name}"
  end
end
