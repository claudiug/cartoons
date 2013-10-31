Cartoons::Application.routes.draw do

  root "default#index"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  match 'announcements/:id/hide', to: 'announcements#hide', as: 'hide_announcements', via: "get"

  resources :cartoons, only: [:index, :show] do
    resources :characters, only: [:index, :show]
    resources :episodes, only: [:index, :show]
  end

  resources :characters, only: [:index, :show] do
    resources :quotes, only: [:index, :show]
    resources :songs, only: [:index, :show]
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
