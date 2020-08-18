Rails.application.routes.draw do
  root 'top#index'
  resources :pictures
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

end
