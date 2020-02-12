Rails.application.routes.draw do
  devise_for :users
  root to: 'pets#index'
  resources :users, only: %i[show edit update]
  resources :pets do
    resources :bookings, only: %i[create]
  end
  resources :bookings, only: [:show] do
    resources :reviews, only: %i[create destroy]
  end
end
