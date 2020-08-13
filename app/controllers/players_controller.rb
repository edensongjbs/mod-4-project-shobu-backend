class PlayersController < ApplicationController
    def index
        # this is the first get request for reloading all current board data
        # sends board data and data about pieces, users
        # essentially everything a create game would send back, but not actually creating anything
        # byebug
        player_id = JWT.decode(params[:token], "Shobu")[0].to_i
        render json: Player.find(player_id)
    end

    def update
        #can update user name?  A little weird, since might not update on other user's side until reload game
    end
end
