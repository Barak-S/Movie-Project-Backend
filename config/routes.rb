Rails.application.routes.draw do
  resources :users
  resources :watch_laters
  resources :movies
  resources :follows
  post 'watch_laters/find_and_delete', :to => 'watch_laters#find_and_delete'
  post 'follows/find_my_followees', :to => 'follows#find_my_followees'


end
