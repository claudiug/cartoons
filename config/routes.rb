Cartoons::Application.routes.draw do


  namespace :admin do
    get "dashboard", to: "dashboard#index"
    resources :cartoons
    resources :characters
    resources :episodes
    resources :songs
    resources :quotes

  end

end
