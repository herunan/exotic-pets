Rails.application.routes.draw do
  devise_for :users
  root to: 'pets#index'
  resources :users, only: [:show, :edit, :update]
  resources :pets do
    resources :bookings
  end
end
