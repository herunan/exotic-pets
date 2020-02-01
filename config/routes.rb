Rails.application.routes.draw do
  devise_for :users
  root to: 'pets#index'
  resources :pets do
    resources :bookings
  end
  resources :bookings do
    resources :reviews
  end
end
