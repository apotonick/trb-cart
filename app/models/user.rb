class User < ActiveRecord::Base
  has_one :cart
end
