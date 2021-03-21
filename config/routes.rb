Rails.application.routes.draw do
  post 'invites/create'
  get 'sessions/new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'sessions/destroy'

  resources :books
  resources :invites, only: %i[new create]
  resources :users
  resources :events
  resources :polls
  root to: 'events#index'
end
