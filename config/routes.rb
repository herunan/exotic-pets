Rails.application.routes.draw do
  devise_for :users
  root to: 'pets#index'
  resources :users, only: [:show, :edit]
  resources :pets do
    resources :bookings
  end
  resources :bookings do
    resources :reviews, except: %i[index show]
  end
end
