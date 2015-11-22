Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  root to: 'profiles#me', constraints: RootConstraint.new
  root to: 'home#index', as: :unauthed_root

  resources :profiles, only: [:show]
  get '/profile/edit', to: 'profiles#edit', as: :edit_profile
  patch '/profile', to: 'profiles#update', as: :update_profile
  get '/profile', to: 'profiles#me', as: :current_profile

  resources :videos
  resources :messages, only: [:create]
  resources :hal_video_callbacks, only: :create
  resources :clients
  

  match "/email_events" => "clients#events", :as => :get_email_events, via: [:get, :post]


  namespace :admin do
    root to: 'core_logic_locations#index'

    resources :core_logic_locations do
      collection do
        post :import
      end
    end
  end
end
