Rails.application.routes.draw do
  devise_for :users
  # get 'works/index'
  root to: "works#index"
  resources :users
  resources :works
  resources :reports
end
