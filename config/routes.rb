Cartoons::Application.routes.draw do

  root "default#index"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"

  resources :cartoons do
    resources :episodes
    resources :characters
    resources :comments
  end


  resources :characters do
    resources :comments
    resources :quotes
  end
  resources :episodes do
    resources :songs
    resources :comments
    resources :quotes
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
