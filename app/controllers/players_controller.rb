class PlayersController < ApplicationController

  def create
    if Player.create!(params.permit(:name))
      render json: {success: "Player #{params[:name]} created."}, status: :created
    else
      render json: {error: "Player already exists with name #{params[:name]}"}, status: :not_acceptable
    end
  end
  
end
