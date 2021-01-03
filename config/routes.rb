Rails.application.routes.draw do
  get 'sessions/new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'sessions/destroy'
  resources :polls
  root to: 'polls#index'
end
