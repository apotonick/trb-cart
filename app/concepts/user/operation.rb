class User < ActiveRecord::Base
  class Create < Trailblazer::Operation
    include Model
    model User, :create

    contract do
      property :email
    end

    def process(params)
      validate(params[:user]) do
        model.cart = Cart.new
        contract.save
      end
    end
  end
end
