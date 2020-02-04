Rails.application.routes.draw do
  devise_for :users, except: %i[index]
  root to: 'pets#index'
  resources :pets do
    resources :bookings
  end
  resources :bookings do
    resources :reviews, except: %i[index show]
  end
end
