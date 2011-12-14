#coding: utf-8
class Shipment < ActiveRecord::Base
  belongs_to :order
  
  ShipmentTypes = ['посылка', 'бандероль']
  
  validates_inclusion_of :shipment_type, in: ShipmentTypes
  validates :postal_identifier, length: { is: 14 }
end
