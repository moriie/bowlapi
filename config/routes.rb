Rails.application.routes.draw do
  get 'rounds/create'
  get 'rounds/update'
  get 'rounds/destroy'
  get 'players/create'
  get 'players/destroy'
  get 'games/create'
  get 'games/update'
  get 'games/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
