Rails.application.routes.draw do
  resources :carts
  resources :decks
  resources :users

  get '/low_high' => 'decks#low_high'
  get '/high_low' => 'decks#high_low'
  get '/small_large' => 'decks#small_large'
  get '/large_small' => 'decks#large_small'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
