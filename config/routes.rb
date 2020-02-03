Rails.application.routes.draw do
  resources :users
  resources :watch_laters
  resources :movies
  resources :follows
  
  # resources :movie_item

end
