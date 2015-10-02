Rails.application.routes.draw do
  root to: 'static_pages#home'

  devise_for :users

  resources :activities
  resources :comments

  resources :users, only: [:index, :show]

  get '/profile', to: 'users#profile', as: :profile

end