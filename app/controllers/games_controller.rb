class GamesController < ApplicationController

  #POST game/create
  def create
    @game = Game.create(params.permit(:player_count))
    if @game.valid? 
      render json: status: :ok
    else
      render json: status: :not_acceptable
    end
  end    

end
