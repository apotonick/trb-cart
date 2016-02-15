require 'test_helper'

class UserOperationTest < MiniTest::Spec
  describe "Create" do
    it "persists" do
      user = User::Create.(user: { email: "oli@trb.to", password: "secret" }).model

      user.persisted?.must_equal true
      user.password_encrypted.must_equal "e5e9fa1ba31ecd1ae84f75caaa474f3a663f05f4"
    end
  end

  describe "Update" do
    let (:user) { User::Create.(user: { email: "oli@trb.to", password: "secret" }).model }

    it "doesn't change password" do
      updated = User::Update.(id: user.id, user: {}).model
      updated.password_encrypted.must_equal "e5e9fa1ba31ecd1ae84f75caaa474f3a663f05f4"
    end
  end
end
