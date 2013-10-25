Cartoons::Application.routes.draw do

  root "default#index"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"

  resources :cartoons, only: [:index, :show] do
    resources :episodes, only: [:index, :show]
    resources :characters, only: [:index, :show]
    resources :comments, only: [:index, :show]
  end


  resources :characters, only: [:index, :show] do
    resources :comments, only: [:index, :show]
    resources :quote, only: [:index, :show]
  end
  resources :episodes do
    resources :songs, only: [:index, :show]
    resources :comments, only: [:index, :show]
    resources :quotes, only: [:index, :show]
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
