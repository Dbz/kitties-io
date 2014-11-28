Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users, only: [:create]
  resources :sessions, only: [:create, :destroy]
  namespace :api, defaults: {format: :json} do
    resources :listings, only: [:create, :show]
    get 'shops/featured_shops/:num', to: 'shops#featured_shops'
    resources :shops, only: [:create, :show]
    resources :users, only: [:show]
  end
end
