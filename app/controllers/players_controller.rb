class PlayersController < ApplicationController
    def index
        # this is the first get request for reloading all current board data
        # sends board data and data about pieces, users
        # essentially everything a create game would send back, but not actually creating anything
        # byebug
        player_id = JWT.decode(params[:jwt], "Shobu")[0].to_i
        player = Player.find(player_id)
        game = player.game
        response = {}
        response["game"] = JSON.parse(game.current_board_json)
        response["pieces"] = ShobuSerializer.pieces_serialize(game.pieces)
        response["players"] = {you: ShobuSerializer.player_serialize(player), opponent: ShobuSerializer.player_serialize(player.opponent)}
        response[:pieces_out] = {you: player.pieces_out, opponent: player.opponent.pieces_out }
        render json: response
    end

    def update
        #can update user name?  A little weird, since might not update on other user's side until reload game
    end
end
