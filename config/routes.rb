Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/games' => "games#index"
  post '/games' => "games#create"
  post '/moves' => "moves#create"
  get '/players' => "players#index"
  patch '/games' => "games#update"
  delete '/games' => "games#delete"
end
