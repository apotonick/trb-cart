require 'test_helper'

class CartOperationTest < MiniTest::Spec
  let (:user) { User.create(email: "nick@trb.to") }

  describe "Create" do
    it "persists valid" do
      res, op = Cart::Create.run(
        cart: {
          user_id:     user.id
        },
      )

      cart = op.model

      cart.persisted?.must_equal true
      cart.user.must_equal user
    end

    it "returns invalid messages" do
      skip
      res, op = Product::Create.run(
        product: {
          description: "Greatest songs ever written!",
        },
      )

      res.must_equal false
      op.model.persisted?.must_equal false
      op.errors.messages.must_equal({:title=>["can't be blank"]})
    end
  end

  describe "Add" do
    let (:cart)    { Cart::Create.(cart: { user_id: user.id }).model }
    let (:product) { Product::Create.(product: {title: "Ruby"}).model }

    it "adds product" do
      op = Cart::Add.(
        id:   cart.id,
        products: [
          {
            id:  product.id,
            qty: 2,
          }
        ]
      )

      cart = op.model
      cart.items.count.must_equal 1
      cart.count.must_equal 2
    end
  end
end
