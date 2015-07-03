Rails.application.routes.draw do
  resources :songs
  root 'search#index'
  get 'search/index'
  get 'search/results'
  post 'search/add_songs'
end
