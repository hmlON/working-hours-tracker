Rails.application.routes.draw do
  root 'home#index'
  resources :jobs, only: [:new, :create]
  devise_for :users
end
