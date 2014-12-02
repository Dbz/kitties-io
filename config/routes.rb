Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users, only: [:create]
  resource :sessions, only: [:create, :destroy]
  namespace :api, defaults: {format: :json} do
    get 'listings/search', to: 'listings#search'
    resources :listings, only: [:create, :show]
    
    get 'shops/featured_shops/:num', to: 'shops#featured_shops'
    resources :shops, only: [:create, :show]
    
    resources :users, only: [:show]
    
    post 'cart/:product_id', to: 'carts#add'
    resource :cart, only: [:show]
  end
end
