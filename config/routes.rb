Rails.application.routes.draw do
  devise_for :admins

  namespace :admin do
    resources :rentals

    root to: 'rentals#index'
  end

  root to: 'home#index'
end
