class CartsController < ApplicationController
  def create
    run Cart::Create do |op|
      flash[:notice] = "Created cart: [#{op.model.id}] \"#{op.model.title}\""

      return redirect_to cart_path(op.model)
    end

    render :new
  end

  def index
    run Cart::Show, params: { current_user: current_user }
  end

  protect_from_forgery except: :add_item
  def add_item
    run Cart::Add, params: params.merge(current_user: current_user) do |op|
      flash[:notice] = "Added [#{op.model.id}] \"#{op.model.inspect}\""

      return redirect_to products_path
    end

    redirect_to products_path
  end
end
