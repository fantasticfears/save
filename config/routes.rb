Rails.application.routes.draw do
  get '/', to: 'static#index', as: :home
  get '/timeline', to: 'static#timeline', as: :timeline

  root to: 'static#index'
end
