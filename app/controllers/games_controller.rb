class GamesController < ApplicationController
    def index
        # byebug
        # sends back a string "waiting" if its not user's turn yet, else
        # returns the updated game board and anything else necessary
        player_id = JWT.decode(params[:jwt], "Shobu")[0].to_i
        player = Player.find(player_id)
        game = player.game
        # game = Game.last
        game_specs = {}
        game_specs[:game] = JSON.parse(game.current_board_json)
        game_specs[:pieces_out] = {you: player.pieces_out, opponent: player.opponent.pieces_out }
        render json: game_specs
    end

    def create
        # byebug
        # creates a new game and all associated data.
        # sends back the initial board set up
        # and all data for the pieces
        # send url links for both players
        player_1_name = params[:player_1_name] || "Player 1"
        player_2_name = params[:player_2_name] || "Player 2"
        game = Game.create()
        game.generate_current_board
        game.players[0].update_attributes(name: player_1_name)
        game.players[1].update_attributes(name: player_2_name)
        response = {}
        response["game"] = JSON.parse(game.current_board_json)
        response["pieces"] = ShobuSerializer.pieces_serialize(game.pieces)
        response["players"] = {you: ShobuSerializer.player_serialize(game.players[0]), opponent: ShobuSerializer.player_serialize(game.players[1])}
        render json: response
    end

    def update
        # resets game back to beginning without creating a new game
    end

    def delete
        # removes the game and everything that belongs to it
    end

    private

    def games_params
        params.require(:game).permit(:player_url, :player_name, :id, :url)
    end
end
