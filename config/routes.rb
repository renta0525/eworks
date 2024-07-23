Rails.application.routes.draw do
  devise_for :users
  # get 'works/index'
  root to: "works#index"
  resources :users, only: [:edit, :update]
  resources :works, only: [:index, :create]
end
