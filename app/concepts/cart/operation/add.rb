class Cart < ActiveRecord::Base
  # Item is a private model/concept, it can only be invoked via
  # Cart::Add.
  class Add < Trailblazer::Operation
    contract do
      feature Disposable::Twin::Persisted

      collection :products, from: :items,
        populator: ->(fragment:, **) {
          products.append Item.new
        } do
          property :id, from: :product_id
          property :qty

          validates :id, presence: true
          validates :qty, presence: true, numericality: true
      end

      property :count, default: 0
    end

    include Model
    model Cart, :create

    def process(params)
      validate(params) do |contract|
        # before_save!
        dispatch!(:before_save)
        contract.save
      end
    end

  private
    def before_save!
      contract.count = contract.products.inject(0) { |memo, p| memo += p.qty }
    end

    callback :before_save do
      collection :products do
        on_add :increment_count!
      end
    end

    def increment_count!(product, options)
      contract.count += product.qty
    end
  end
end
