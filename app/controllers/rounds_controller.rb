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
    @player = Player.find(params[:player_id])
    @prev = Round.find(params[:id]-1)

    @round.first_roll = params[:pins_hit]

    if params[:pins_hit] === 10
      @round.strike = true
    end

    @player.score = @player.score + params[:pins_hit]    
    add_total(params[:pins_hit])

    if @prev.strike === true || @prev.spare === true
      redirect_to "game/#{@round.game_id}/round/#{@round.id-1}/bonus/#{params[:pins_hit]}"
    end
  end

  def second_attempt
    @round = Round.find(params[:id])
    @round.second_roll = params[:pins_hit]

    if @round.first_roll + @round.second_roll === 10 
      @round.spare = true
    end
    
    @player.score = @player.score + params[:pins_hit]    
    add_total(params[:pins_hit])

    if @prev.strike === true
      redirect_to "game/#{@round.game_id}/round/#{@round.id-1}/bonus/#{params[:pins_hit]}"
    end
  end

  def add_bonus
    @round = Round.find(params[:id])

    @player.score = @player.score + params[:pins_hit]    
    add_total(params[:pins_hit])
  end

  def add_total(points)
    @round = Round.find(params[:id])
    @round.total = @round.total + points
  end

end
