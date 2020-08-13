class MovesController < ApplicationController

    def create
        # takes in a piece id and a destination square
        # creates the new move object based on this info
        #
        # byebug
        the_piece = Piece.find(params[:piece_id].to_i)
        game = the_piece.player.game
        start_square = the_piece.current_square
        end_square = game.find_square_by_coords(params[:coordinates])
        Move.create(piece: the_piece, start_square: start_square, end_square: end_square)
        game.generate_current_board
        render json: game.current_board_json
    end

    private

    # def move_params
    #     params.require(:move).permit(:coordinates, :piece_id)
    # end
end
