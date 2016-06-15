require 'test_helper'

class ProductOperationTest < MiniTest::Spec
  describe "Create" do
    it "persists valid" do
      res, op = Product::Create.run(
        product: {
          title:       "Best Of The Police",
          description: "Greatest songs ever written!",
        },
      )

      product = op.model

      product.persisted?.must_equal true
      product.title.must_equal "Best Of The Police"
      product.description.must_equal "Greatest songs ever written!"
    end

    it "returns invalid messages" do
      res, op = Product::Create.run(
        product: {
          description: "Greatest songs ever written!",
        },
      )

      res.must_equal false
      op.model.persisted?.must_equal false
      op.errors.messages.must_equal({:title=>["can't be blank", "is too short (minimum is 2 characters)"]})
    end
  end

  # describe "Update" do
  #   let (:product) { Product::Create.(product: {title: "Ruby"}).model }

  #   it "persists valid" do
  #     op = Product::Update.(
  #       id:      product.id,
  #       product: { description: "Dynamic OOP." }
  #     )

  #     op.model.title.must_equal "Ruby"
  #     op.model.description.must_equal "Dynamic OOP."
  #   end
  # end
end
