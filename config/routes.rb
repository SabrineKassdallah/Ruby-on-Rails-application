Rails.application.routes.draw do
  get 'api/status', controller: 'application', action: 'status'
  get 'api/products', controller: 'products', action: 'index'
  post 'api/products', controller: 'products', action: 'create'
  delete 'api/delete_product/:id', controller: 'products', action: 'delete'
  put 'api/update_product/:id', controller: 'products', action: 'update'
  get 'api/product/:id', controller: 'products', action: 'show'

  # resources :users
  post  'api/auth/login', to:  'authentication#login'
  post  'api/auth/signup', to:  'users#create'

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
