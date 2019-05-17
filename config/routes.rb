Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :stack, only: %i(index show)

  namespace :admin do
    resources :home, only: %i(index)
  end
end
