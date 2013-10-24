Cartoons::Application.routes.draw do

  get "songs/index"
  get "songs/new"
  get "songs/create"
  get "songs/show"
  get "songs/edit"
  get "songs/update"
  get "songs/destroy"
  get "quotes/admin"
  get "quotes/new"
  get "quotes/create"
  get "quotes/edit"
  get "quotes/update"
  get "quotes/show"
  get "quotes/destroy"
  namespace :admin do
    get "dashboard", to: "dashboard#index"
    resources :cartoons
    resources :characters
    resources :episodes

  end

end
