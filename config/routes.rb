Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v0 do
      resources :users
    end
  end

  resources :users, only: %i[show edit update]
  resources :couples, only: %i[create show destroy] do
    resources :activities
  end
  resources :statuses

  get '/', to: 'static#index', as: :home
  get '/timeline', to: 'static#timeline', as: :timeline

  root to: 'static#index'
end
