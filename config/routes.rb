Rails.application.routes.draw do
  root :to => 'home#index'

  resources :images

  resources :profile

  devise_for :users
end
