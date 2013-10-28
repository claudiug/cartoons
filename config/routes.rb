
Cartoons::Application.routes.draw do

  root "default#index"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"

  resources :cartoons, only: [:index, :show] do

    resources :characters, only: [:index, :show] do
        resources :quotes, only: [:index, :show]
    end
    resources :episodes, only: [:index, :show] do

    end

  end







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
