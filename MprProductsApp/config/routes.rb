Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  get 'admin/products', to: 'products#index'
  match 'products/create', to: 'products#new', via: [:get, :post]
  match '/products/:id/edit', to: 'products#edit', via: [:get, :post]
  get '/products/:id', to: 'products#show'

end
