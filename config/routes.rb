Cartoons::Application.routes.draw do
  resources :comments

  root "default#index"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"

  namespace :admin do
    get "dashboard", to: "dashboard#index"
    get "statistic", to: "dashboard#statistic"
    resources :cartoons
    resources :characters
    resources :episodes
    resources :songs
    resources :quotes
    resources :accounts, only: [:new, :create]
  end




end
