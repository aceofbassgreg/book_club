Rails.application.routes.draw do
  resources :polls
  root to: "polls#index"
end
