Rails.application.routes.draw do
  get '/', to: 'static#index'
  get '/timeline', to: 'static#timeline'

  root to: 'static#index'
end
