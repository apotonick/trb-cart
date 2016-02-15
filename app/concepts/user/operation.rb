class User < ActiveRecord::Base
  class Create < Trailblazer::Operation
    include Model
    model User, :create

    contract do
      property :email
      property :password, virtual: true

      property :password_encrypted
    end

    def process(params)
      validate(params[:user]) do
        model.cart = Cart.new

        encrypt_password!(contract)

        contract.save
      end

    end

    require "digest"
  private
    # Note that user here is the contract twin. we set the encrypted pw on the contract, too.
    def encrypt_password!(user)
      return unless user.changed?(:password) # only run when the contract's password field changed (from nil to XXX).
      user.password_encrypted = Digest::SHA1.hexdigest(user.password)
    end
  end

  class Update < Create
    model User, :find
  end
end
