class GamesController < ApplicationController

  #POST game/create
  def create
    @game = Game.create(params.permit(:player_count))
    if @game.valid? 
      render json: {success: "Starting game number #{@game.id}..."}, status: :ok
    else
      render json: {error: "Something went wrong. Please try again."}, status: :not_acceptable
    end
  end    

end
