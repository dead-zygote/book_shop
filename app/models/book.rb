# coding: utf-8
class Book < ActiveRecord::Base
  belongs_to :publisher
  belongs_to :cover_type
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :categories
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :cart_items
  has_many :carts, through: :cart_items
  
  mount_uploader :image, BookImageUploader

  validates :title, presence: true
  
  validates :isbn, uniqueness: { allow_nil: true }
  
  validates_numericality_of :price, greater_than: 0
  
  validates_numericality_of :quantity, greater_than_or_equal_to: 0,
                            only_integer: true

  validates_numericality_of :weight, greater_than: 0,
                            only_integer: true,
                            allow_nil: true
                            
  validates_numericality_of :year, only_integer: true,
                            allow_nil: true
                            
  self.per_page = 20
  
  define_index do
    indexes :title
    indexes :isbn
    indexes authors.name, :as => :authors
  end
  
  def author_names=(string)
    @author_names = string.split(',').map(&:strip).delete_if(&:empty?).join(', ')
  end
  
  def author_names
    @author_names ||= self.authors.map(&:name).join(', ')
  end
  
  def category_names=(string)
    @category_names ||= string.split(',').map(&:strip).delete_if(&:empty?).join(', ')
  end
  
  def category_names
    @category_names ||= self.categories.map(&:name).join(', ')
  end
  
  before_save do
    self.authors = self.author_names.split(', ').map do |name|
      Author.find_or_create_by_name(name)
    end
    self.categories = self.category_names.split(', ').map do |name|
      Category.find_or_create_by_name(name)
    end
  end
  
  before_destroy do
    return false if self.order_items.any?
    self.cart_items.each &:destroy
  end
end
