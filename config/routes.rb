Rails.application.routes.draw do
  root 'home#index' 
  get 'carts/empty_cart'
  get 'store/seller'
  resources :orders
  resources :line_items
  resources :carts
  get "search", to: "products#search"
  resources :charges
  # get 'store/index'
  get 'store/index', as: 'store_index'
  
  # resources :products
  resources :categories
  # devise_for :admins
  # devise_for :sellers
  # devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :sellers, controllers: {
    sessions: 'sellers/sessions',
    passwords: 'sellers/passwords',
    registrations: 'sellers/registrations'
  }
  resources :products do
    get :who_bought, on: :member
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      #devise_for :users
      resources :users, :only => [:index]
    end
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
