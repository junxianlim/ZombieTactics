class GamesController < ApplicationController
  before_filter :authenticate_player!, except: [:index]

  def index
    @players = Player.all
    @games = Game.all
  end

  def setup
    @player2 = Player.find(params[:player_id])
    @game = Game.setup(player1: current_player, player2: @player2 )

    if @game
      redirect_to @game, notice: "Brainssssss"
    else
      flash[:error] = "Uh oh, something went wrong creating a game!"
      redirect_to root_path
    end
  end

  def show
    @game = Game.find(params[:id])
    @gridfields = @game.map.gridfields.includes(:gridobject, :character).all
    unless current_player == @game.player1 || current_player == @game.player2
      flash[:error] = "Sorry, you can't access this game!"
      redirect_to root_path
    end
  end 

end