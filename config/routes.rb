
Cartoons::Application.routes.draw do

  root "default#index"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"

  # site/cartoons
  # site/cartoon/FUTURAMA
  # site/cartoon/FUTURAMA/comments/new
  # site/cartoon/FUTURAMA/comments/show
  # site/cartoon/FUTURAMA/characters
  # site/cartoon/FUTURAMA/characters/BENDER/comments
  # site/cartoon/FUTURAMA/characters/BENDER/comments/new
  # site/cartoon/FUTURAMA/characters/BENDER/comments/new
  # site/cartoon/FUTURAMA/characters/BENDER/quotes
  # site/cartoon/FUTURAMA/characters/BENDER/quotes/cool-quote/comments
  # site/cartoon/FUTURAMA/episodes/comments
  # site/cartoon/FUTURAMA/episodes/PILOT/comments

  resources :cartoons, only: [:index, :show] do
    resources :comments, only: [:index, :new]
    resources :characters, only: [:index, :show] do
      resources :comments, only: [:index, :new]
      resources :quotes, only: [:index, :show] do
        resources :comments, only: [:index, :new]

      end

    end
    resources :episodes, only: [:index, :show] do
      resources :comments, only: [:index, :new]

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
