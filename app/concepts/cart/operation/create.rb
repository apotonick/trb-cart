class Cart < ActiveRecord::Base
  class Create < Trailblazer::Operation
    contract do
      property :user_id

      require "reform/form/validation/unique_validator"
      validates :user_id, presence: true, unique: true
    end

    include Model
    model Cart, :create

    def process(params)
      validate(params[:cart]) do |contract|
        contract.save
      end
    end
  end
end
