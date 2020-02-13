Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[show edit update]
  resources :pets do
    resources :bookings, only: :create
  end
  resources :bookings, only: :show do
    resources :reviews, only: %i[create destroy]
  end
  root to: 'pets#index'
end
