Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resource :job, only: [:new, :create, :edit, :update]
  resources :worked_days, only: [:create]
  get 'dashboard' => 'dashboard#index'
end
