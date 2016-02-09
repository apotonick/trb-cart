Rails.application.routes.draw do
  root to: 'products#index'

  post 'carts/add' => 'carts#add_item'
  resources :carts
  resources :products
  resources :users
end
