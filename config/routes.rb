Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  root to: 'profiles#me', constraints: RootConstraint.new
  root to: 'home#index', as: :unauthed_root

  resources :profiles, only: [:show]
  patch '/profile', to: 'profiles#update', as: :update_profile
  get '/profile', to: 'profiles#me', as: :current_profile
end
