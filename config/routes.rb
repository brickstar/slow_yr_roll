Rails.application.routes.draw do
  resources :songs
  root to: 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :dashboard, only: [:index]
  get '/stream/:id', to: 'songs#stream', as: :stream
end
