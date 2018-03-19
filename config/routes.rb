Rails.application.routes.draw do
  resources :products
  root controller: :products, action: :index
end
