Rails.application.routes.draw do
  devise_for :users

  root to: 'boats#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :boats do
    resources :bookings, only: [:create, :destroy] do
      resources :reviews, only: [:create]
    end
  end

   resources :bookings, only: [:show] do
      resources :reviews, only: [:new, :create]
    end


  patch '/bookings/:id/accept', to: 'bookings#accept', as: :accept_booking
  patch '/bookings/:id/decline', to: 'bookings#decline', as: :decline_booking


  get 'own_boats', to: 'boats#own_boats', as: :own_boats
  get 'dashboard', to: 'boats#dashboard', as: :dashboard
end
