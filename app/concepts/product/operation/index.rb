class Product < ActiveRecord::Base
  class Index < Trailblazer::Operation
    def process(params)
      @model = Product.all
    end
  end
end
