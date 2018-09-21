Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :locations, only: [:index]
      resources :users, only: [:index, :create]
      # resources :relationships, only: [:index]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
