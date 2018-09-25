Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :locations, only: [:index]
      resources :users, only: [:index, :create, :current_user]
      # resources :relationships, only: [:index]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'

      resources :conversations, only: [:index, :create]
      resources :messages, only: [:create]

      mount ActionCable.server => '/cable'
    end
  end
end
