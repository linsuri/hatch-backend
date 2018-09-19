Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :locations, only: [:index]
      resources :users, only: [:index]
      resources :relationships, only: [:index]
    end
  end
end
