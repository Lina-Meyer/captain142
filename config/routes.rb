Rails.application.routes.draw do
  devise_for :users

  root to: 'boats#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :boats
  get 'own_boats', to: 'boats#own_boats', as: :own_boats
end
