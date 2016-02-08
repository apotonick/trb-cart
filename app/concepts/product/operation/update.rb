class Product < ActiveRecord::Base
  class Update < Create
    model Product, :find
  end
end
