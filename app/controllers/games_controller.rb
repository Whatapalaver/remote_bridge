# frozen_string_literal: true
class GamesController < ApplicationController
  before_action :setup_exchange, :load_games
  before_action :set_game, only: [:show]

  def index
    @first_game = @games.first
  end

  def show; end

  def search
    redirect_to games_path, notice: 'Search was blank.' and return if search_params['id'].blank?

    redirect_to game_path(search_params[:id])
  end

  private

  def setup_exchange
    @bridge_exchange = BridgeExchange.new
  end

  def load_games
    @games = @bridge_exchange.games
  end

  def set_game
    @game = @bridge_exchange.game(params[:id])

    redirect_to games_path, notice: 'Game ID was not recognised' if @game.nil?
  end

  def search_params
    params.permit(:id)
  end
end
