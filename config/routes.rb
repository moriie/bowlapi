Rails.application.routes.draw do

  post 'new_game/:player_count', to: 'games#create'
  post 'game/:game_id/add_player/:name', to: 'players#create'
  post 'game/:game_id/:player_id/round/create', to: 'rounds#create'
  post 'game/:game_id/:player_id/round/:id/roll/1/:pins_hit', to: 'rounds#first_attempt'
  post 'game/:game_id/:player_id/round/:id/roll/2/:pins_hit', to: 'rounds#first_attempt'
  get 'game/:game_id/:player_id/round/:id/bonus/:pins_hit', to: 'rounds#add_bonus'

end
