Rails.application.routes.draw do
  post 'new_game', to: 'games#create'
  post 'add_player', to: 'players#create'
  post 'game/:game_id/:player_id/round/create', to: 'rounds#create'
  post 'game/:game_id/:player_id/round/:id/roll/1/:pins_hit', to: 'rounds#first_attempt'
  post 'game/:game_id/:player_id/round/:id/roll/2/:pins_hit', to: 'rounds#first_attempt'
  get 'game/:game_id/:player_id/round/:id/bonus/:pins_hit', to: 'rounds#add_bonus'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
