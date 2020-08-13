class GamesController < ApplicationController
    def index
        # sends back a string "waiting" if its not user's turn yet, else
        # returns the updated game board and anything else necessary
        game = Game.last
        render json: game.current_board_json
    end

    def create
        # creates a new game and all associated data.
        # sends back the initial board set up
        # and all data for the pieces
        # send url links for both players
        game = Game.create(url:games_params["url"])
        game.generate_current_board
        response = {}
        response["current_board"] = game.current_board_json
        response["game"] = game
        response["pieces"] = game.pieces
        response["players"] = game.players
        render json: response
    end

    def delete
        # removes the game and everything that belongs to it
    end

    private

    def games_params
        params.require(:game).permit(:player_url, :id, :url)
    end
end
