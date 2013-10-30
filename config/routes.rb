Cartoons::Application.routes.draw do

  root "default#index"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  match 'announcements/:id/hide', to: 'announcements#hide', as: 'hide_announcements', via: "get"

  #/cartoons/index
  #/cartoons/futurama/comments
  resources :cartoons, only: [:index, :show] do
    resources :comments, only: [:index, :new, :create]
  end

  #/character/peter/comments
  resources :characters, only: [:index, :show] do
    resources :comments, only: [:index, :new, :create]
  end

  #/episodes/pilot/comments
  resources :episodes, only: [:index, :show] do
    resources :comments, only: [:index, :new, :create]
  end

  #/quotes/comments
  resources :quotes, only: [:index, :show] do
    resources :comments, only: [:index, :new, :create]
  end

  #/songs/comments
  resources :songs, only: [:index, :show] do
    resources :comments, only: [:index, :new, :create]
  end

  #songs/comments
  resources :characters, only: [:index, :show] do
    resources :quotes, only: [:index, :show]
  end

  #/cartoons/futurama/bender/quotes/best-one
  #/cartoons/futurama/bender/songs/la-la-la-aaaa
  #/cartoons/futurama/episodes/best-episodes
  resources :cartoons, only: [:index, :show] do
    resources :characters, only: [:index, :show] do
      resources :quotes, only: [:index, :show]
      resources :songs, only: [:index, :show]
    end
    resources :episodes, only: [:index, :show]
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
