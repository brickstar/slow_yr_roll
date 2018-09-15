Rails.application.routes.draw do
  resources :songs
  root to: 'songs#index'
  post "songs/upload", :as => "upload"
  delete "songs/delete", :as => "delete"
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :dashboard, only: [:index]
  get '/stream/:id', to: 'songs#stream', as: :stream
end
