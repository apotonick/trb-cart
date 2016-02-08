class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :items
  # has_many :products, through: :item
end
