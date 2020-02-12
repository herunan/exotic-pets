Rails.application.routes.draw do
  devise_for :users
  root to: 'pets#index'
  resources :users, only: %i[show edit update]
  resources :pets do
    resources :bookings
    resources :reviews, only: %i[create destroy]
  end
end
