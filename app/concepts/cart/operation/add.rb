class Cart < ActiveRecord::Base
  # Item is a private model/concept, it can only be invoked via
  # Cart::Add.
  class Add < Trailblazer::Operation
    contract do
      collection :products, from: :items,
        populator: ->(fragment:, **) {
          products.append Item.new
        } do
          property :id, from: :product_id
          property :qty

          validates :id, presence: true
          validates :qty, presence: true, numericality: true
      end
    end

    include Model
    model Cart, :create

    def process(params)
      validate(params) do |contract|
        contract.save
      end
    end
  end
end
