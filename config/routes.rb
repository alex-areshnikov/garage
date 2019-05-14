Rails.application.routes.draw do
  root to: 'home#index'

  resources :stack, only: %i(index show)
end
