class PlayersController < ApplicationController

  #POST player/create
  def create
    if Player.create!(params.permit(:name))
      render json: status: :created
    else
      render json: status: :not_acceptable
  end

  def destroy
    @player = Player.find(params[:id])
    if @player.destroy
        render json: {success: "Player #{@player.name} deleted"}, status: :ok
    else
        render json: {error: 'Something went wrong...please try again.'}, status: :bad_request
    end
  end
end
