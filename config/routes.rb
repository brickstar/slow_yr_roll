Rails.application.routes.draw do
  resources :songs
  root to: 'welcome#index'
  get '/stream', to: 'songss#stream', as: :stream
end
