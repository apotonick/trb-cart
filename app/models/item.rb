class Item < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
end
