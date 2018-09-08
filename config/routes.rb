Rails.application.routes.draw do
  resources :songs
  root to: 'welcome#index'
  get "/auth/:provider/callback", to: "sessions#create"
  get  'logout', to: 'sessions#destroy'
end
