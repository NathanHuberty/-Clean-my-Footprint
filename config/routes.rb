Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trips, only: :create
  resources :compensations, only: :create
  resources :projects, only: :show
  resources :users, only: :show
  mount Attachinary::Engine => '/attachinary'
end
