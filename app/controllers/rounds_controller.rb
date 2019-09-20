class RoundsController < ApplicationController
  
  def create
    @round = Round.create(params.permit(:game_id, :player_id, :round_num))
    @player = Player.find(params[:player_id])
    if @round.valid?
      render json: {success: "#{@player.name}, you're up!"}, status: :ok
    else
      render json: {error: "Unable to start round - please reset"}, status: :bad_request
    end
  end

  def first_attempt
    @round = Round.find(params[:id])
    @round.first_roll = params[:pins_hit]

    if params[:round_num] != '1'
      @prev = Round.find_by(game_id: params[:game_id], round_num: params[:round_num].to_i-1)
    end

    if params[:pins_hit] == '10'
      @round.strike = true
    end

    add_total(Integer(params[:pins_hit]))

    if @prev && (@prev.strike == true || @prev.spare == true)
      add_bonus(params[:pins_hit].to_i)
    end

  end

  def second_attempt
    @round = Round.find(params[:id])
    @round.second_roll = params[:pins_hit]

    if params[:round_num] != 1
      @prev = Round.find_by(game_id: params[:game_id], round_num: params[:round_num].to_i-1)
    end

    if @round.first_roll + @round.second_roll == '10' 
      @round.spare = true
    end
    
    add_total(params[:pins_hit].to_i)

    if @prev && (@prev.strike == true)
      add_bonus(params[:pins_hit].to_i)
    end
  end

  def add_bonus(points)
    @prev = Round.find_by(game_id: params[:game_id], round_num: params[:round_num].to_i-1)
    @prev.total = @prev.total + points
    @prev.save
  end

  def add_total(points)
    @round.total = @round.total + points
    @round.save
  end

end
