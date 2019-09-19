class RoundsController < ApplicationController
  def create
    @round = Round.create(params.permit[:game_id, :player_id], total: 0)
    @player = Player.find(params[:player_id])
    if @round.valid?
      render json: {"#{@player.name}, you're up!"}, status: :ok
    else
      render json: {"Unable to start round - please reset"}, status: :bad_request
  end

  def first_attempt
    @round = Round.find(params[:id])
    @pins_hit = params[:hit]

    @
  end

  def second_attempt
  end

  def add_strike
  end

  def add_spare
  end

  def create_total

  def destroy
    @round = Round.find(params[:id])
    @round.destroy
  end
end
