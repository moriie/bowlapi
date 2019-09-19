class GamesController < ApplicationController

  def create
    @game = Game.create(params.permit(:players), scores: '')
    if @goal.valid? 
      render json: status: :ok
    else
      render json: status: :not_acceptable
    end
  end

  def update
    @game = Game.find(params[:id])

  end

  def destroy

  end

end
