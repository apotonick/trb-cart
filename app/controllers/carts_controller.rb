class CartsController < ApplicationController
  def create
    run Cart::Create do |op|
      flash[:notice] = "Created cart: [#{op.model.id}] \"#{op.model.title}\""

      return redirect_to cart_path(op.model)
    end

    render :new
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def add_item
    run Cart::Add do |op|
      flash[:notice] = "Added [#{op.model.id}] \"#{op.model.inspect}\""

      return redirect_to products_path
    end

    redirect_to products_path
  end

end
