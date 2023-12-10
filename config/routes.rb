Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resource :user_roles, only: [:edit, :update]
  resources :appointments do
    get 'doctors_search', on: :collection
  end

  post '/appointments', to: 'appointments#create'


end
