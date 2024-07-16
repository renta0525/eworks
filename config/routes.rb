Rails.application.routes.draw do
  get 'works/index'
  root to: "works#index"
end
