Rails.application.routes.draw do
  devise_for :admins

  namespace :admin do
    resources :rentals do
      post 'calculate-rental', to: 'rentals#calculate_rental_value', on: :new
    end
    resources :people
    resources :vehicles

    root to: 'rentals#index'
  end

  root to: 'home#index'
end
