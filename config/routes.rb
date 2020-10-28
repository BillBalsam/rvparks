Rails.application.routes.draw do
  devise_for :hosts
  devise_for :users
  # get '/user' => "users#show", :as => :user_root
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :about, only: :index
  resources :profile
  resources :places do
    resources :charges
    resources :photos
  end
  
  resources :users
  resources :hosts
  
  end
