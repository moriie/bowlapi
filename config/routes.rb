Rails.application.routes.draw do
  
  post 'new_game', to: 'games#create'
  post 'game/add_player', to: 'players#create'
  post 'game/round/:round_num/create', to: 'rounds#create'
  post 'game/round/:round_num/roll/1', to: 'rounds#first_attempt'
  post 'game/round/:round_num/roll/2', to: 'rounds#second_attempt'
  post 'game/round/:round_num/bonus', to: 'rounds#add_bonus'

end
