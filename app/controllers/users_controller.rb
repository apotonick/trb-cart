class UsersController < ApplicationController
  skip_before_filter :require_current_user

  def new
    form User::Create
  end

  def create
    run User::Create do |op|
      flash[:notice] = "User created: [#{op.model.id}] \"#{op.model.email}\""

      return redirect_to products_path
    end

    redirect_to :new
  end

end
