Rails.application.routes.draw do
  devise_for :users

  root to: 'admin/home#index'

  resources :stack, only: %i(index show)
end
