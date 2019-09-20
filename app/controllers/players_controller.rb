class PlayersController < ApplicationController

  def create
    if Player.create!(params.permit(:name))
      render json: status: :created
    else
      render json: status: :not_acceptable
  end

end
