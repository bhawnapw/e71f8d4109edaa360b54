Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "welcome#index"
  resources :favourite_tv_shows, only: :index
  post '/favourites/:show_id' => 'favourite_tv_shows#favourite', as: :favourite
  delete '/unfavourites/:show_id' => 'favourite_tv_shows#unfavourite', as: :unfavourite
end
