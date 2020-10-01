class MovesController < ApplicationController

    def create
        # takes in a piece id and a destination square
        # creates the new move object based on this info
        #
        # byebug
        the_piece = Piece.find(params[:piece_id].to_i)
        # player = the_piece.player
        player_id = JWT.decode(params[:jwt], "Shobu")[0].to_i
        player = Player.find(player_id)
        game = player.game
        start_square = the_piece.current_square
        end_square = game.find_square_by_coords(params[:coordinates])
        # byebug
        Move.create(piece: the_piece, start_square: start_square, end_square: end_square)
        game.generate_current_board
        game_specs = {}
        game_specs[:game] = JSON.parse(game.current_board_json)
        game_specs[:pieces_out] = {you: player.pieces_out, opponent: player.opponent.pieces_out }
        GamesChannel.broadcast_to(game, game_specs)
        render json: game_specs
    end

    private

    # def move_params
    #     params.require(:move).permit(:coordinates, :piece_id)
    # end
end
