class Product < ActiveRecord::Base
  class Create < Trailblazer::Operation
    contract do
      property :title
      property :description

      validates :title, presence: true
    end

    include Model
    model Product, :create

    def process(params)
      validate(params[:product]) do |contract|
        contract.save
      end
    end
  end
end
