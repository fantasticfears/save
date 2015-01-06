Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v0 do
      resources :users
    end
  end

  get '/', to: 'static#index', as: :home
  get '/timeline', to: 'static#timeline', as: :timeline

  root to: 'static#index'
end
