Rails.application.routes.draw do
  get 'translations/update'
  resources :songs, except: [:index]
  root to: 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resource :translation, only: [:update]
end
