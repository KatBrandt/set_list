Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/songs', to: 'songs#index'
  # get '/songs/:id', to: 'songs#show'
  resources :songs, only: [:index, :show]

  # get '/artists/:artist_id/songs', to: 'artist_songs#index'
  # get '/artists/:artist_id/songs/new', to: 'songs#new'
  # post '/artists/:artist_id/songs', to: 'songs#create'


  # get '/artists', to: 'artists#index'
  # get '/artists/new', to: 'artists#new'
  # post '/artists', to: 'artists#create'
  # get '/artists/:id/edit', to: 'artists#edit'
  # patch '/artists/:id', to: 'artists#update'
  # delete '/artists/:id', to: 'artists#destroy'
  resources :artists do
    resources :songs, only: [:index, :new, :create]
  end
  # get '/playlists', to: 'playlists#index'
  resources :playlists, only: [:index]

  get '/cart', to: 'cart#index'
  patch '/cart/:song_id', to: 'cart#update'
end
