class GamesController < ApplicationController
    def show
        # sends back a string "waiting" if its not user's turn yet, else
        # returns the updated game board and anything else necessary
    end

    def create
        # creates a new game and all associated data.
        # sends back the initial board set up
        # and all data for the pieces
        # send url links for both players
        shobu = Gam
    end

    def delete
        # removes the game and everything that belongs to it
    end

    private

    def games_params
        params.require(:game).permit(:player_url, :id)
    end
end
