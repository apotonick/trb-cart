class ProductsController < ApplicationController
  def new
    form Product::Create
  end

  def create
    # @product = Product.find(params[:product_id]) # UI-specific logic!

    run Product::Create do |op|
      flash[:notice] = "Created product: [#{op.model.id}] \"#{op.model.title}\""

      return redirect_to product_path(op.model)
    end

    render :new
  end

  def index
    @products = Product.all
    @user = User.new(email: 'email@trb.to')
    @cart = Cart.find_by(user_id: @user.id)
  end

  def show
    @product = Product.find(params[:id])
  end
  
end
