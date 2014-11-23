Rails.application.routes.draw do
  root :to => 'pages#home'
  resource :user, only: [:create]
  resources :sessions, only: [:create, :destroy]
  namespace :api do
    resources :listings, only: [:create, :show]
  end
end
