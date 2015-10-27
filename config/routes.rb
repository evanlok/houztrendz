Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  root to: 'profiles#me', constraints: RootConstraint.new
  root to: 'home#index', as: :unauthed_root

  resources :profiles, only: [:show]
  get '/profile/edit', to: 'profiles#edit', as: :edit_profile
  patch '/profile', to: 'profiles#update', as: :update_profile
  get '/profile', to: 'profiles#me', as: :current_profile

  resources :videos
  resources :hal_video_callbacks, only: :create
end
