Rails.application.routes.draw do
  resources :songs
  resources :users, only: [:new, :create, :show]
  root 'users#new'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

end
