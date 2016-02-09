Rails.application.routes.draw do
  root to: 'products#index'

  post 'carts/:id/add' => 'carts#add_item'
  resources :products

  resources :users
end
