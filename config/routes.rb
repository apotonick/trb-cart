Rails.application.routes.draw do
  root to: 'products#new'

  resources :products
end
