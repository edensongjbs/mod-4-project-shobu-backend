class GameGenerator
    def self.shobu_matrix
        [
            [
                [nil, nil, nil, nil],
                [nil, nil, nil, nil],
                [nil, nil, nil, nil],
                [nil, nil, nil, nil],
            ],
            [
                [nil, nil, nil, nil],
                [nil, nil, nil, nil],
                [nil, nil, nil, nil],
                [nil, nil, nil, nil],
            ],
            [
                [nil, nil, nil, nil],
                [nil, nil, nil, nil],
                [nil, nil, nil, nil],
                [nil, nil, nil, nil],
            ],
            [
                [nil, nil, nil, nil],
                [nil, nil, nil, nil],
                [nil, nil, nil, nil],
                [nil, nil, nil, nil],
            ],
        ]
    end

    def self.generate_game(shobu)
        shobu_matrix = self.shobu_matrix
        shobu_board = []

        4.times do |i| 
            shobu_board << Board.create(game: shobu, quadrant:i, description:"")
        end
        
        dead_board = Board.create(game: shobu, quadrant: 4, description: "where pieces go to die")
        dead_square = Square.create(board: dead_board, coordinates: "00", dead_square: true)
        
        shobu_board.each_with_index do |board, board_index|
            4.times do |i1|
                4.times do |i2|
                    coords = "#{i1}#{i2}"
                    shobu_matrix[board_index][i1][i2] = Square.create(board: board, coordinates: coords)
                end
            end
        end
        
        
        
        player1 = Player.create(name: "Player 1", game: shobu, username: "player1", url: "player1", primary: true)
        player2 = Player.create(name: "Player 2", game: shobu, username: "player2", url: "player2", primary: false)
        
        # Put in logic for generating JWTs for URLS and sending that data to front end
        
        4.times do |board_id|
            4.times do |row_id| 
                the_piece = Piece.create(url:"", player: player1, color: "white")
                Move.create!(done: false, read: true, aggressive: false, start_square: shobu_matrix[board_id][row_id][0], end_square: shobu_matrix[board_id][row_id][0], piece: the_piece)
            end
        end
        
        4.times do |board_id|
            4.times do |row_id| 
                the_piece = Piece.create(url:"", player: player2, color: "black")
                Move.create!(done: false, read: true, aggressive: false, start_square: shobu_matrix[board_id][row_id][3], end_square: shobu_matrix[board_id][row_id][3], piece: the_piece)
            end
        end
    end
end