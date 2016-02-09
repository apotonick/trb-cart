class Product < ActiveRecord::Base
  class Create < Trailblazer::Operation
    include Model
    model Product, :create

    contract do
      property :title
      property :description
      property :price

      validates :title, presence: true
      # validates :price, presence: true
    end


    def process(params)
      validate(params[:product]) do |contract|
        contract.save
      end
    end
  end
end
