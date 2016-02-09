class Cart < ActiveRecord::Base
  class Show < Trailblazer::Operation
    # def model!(params)
    #   params[:current_user].cart
    # end

    def process(params)
      @model = params[:current_user].cart
    end
  end
end
