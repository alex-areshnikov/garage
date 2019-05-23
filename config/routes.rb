Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :stack, only: %i(index show)

  namespace :admin do
    resources :home, only: %i(index)

    resources :sites do
      resources :documents, except: %i(index)
    end

    resources :people do
      resources :documents, except: %i(index)
    end
  end
end
