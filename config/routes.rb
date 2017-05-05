Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :jobs, only: [:new, :create]
  resources :worked_days, only: [:create]
  get 'dashboard' => 'dashboard#index'
end
