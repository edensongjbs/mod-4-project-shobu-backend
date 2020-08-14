






class GameGenerator

    def self.black_stones
        stone_b1 = "https://i.postimg.cc/zXsybcVv/blk-stone-1.png"
        stone_b2 = "https://i.postimg.cc/zGwGLDs2/blk-stone-2.png"
        stone_b3 = "https://i.postimg.cc/V6hfyJtv/blk-stone-3.png"
        stone_b4 = "https://i.postimg.cc/jqGfP51R/blk-stone-4.png"
        [stone_b1, stone_b2, stone_b3, stone_b4]
    end
    
    def self.white_stones
        stone_w1 = "https://i.postimg.cc/6387GJL7/wht-stone-1.png"
        stone_w2 = "https://i.postimg.cc/4xXmQhQR/wht-stone-2.png"
        stone_w3 = "https://i.postimg.cc/mD1Dg3BC/wht-stone-3.png"
        stone_w4 = "https://i.postimg.cc/m2sDTFq1/wht-stone-4.png"
        white_stones = [stone_w1, stone_w2, stone_w3, stone_w3]
    end
    
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
                the_piece = Piece.create(url: white_stones.sample, rotation: "#{Kernel.rand(360).to_s}deg",  player: player1, color: "white")
                Move.create!(done: false, read: true, aggressive: false, start_square: shobu_matrix[board_id][row_id][0], end_square: shobu_matrix[board_id][row_id][0], piece: the_piece)
            end
        end
        
        4.times do |board_id|
            4.times do |row_id|
                the_piece = Piece.create(url: black_stones.sample, rotation: "#{Kernel.rand(360).to_s}deg",  player: player2, color: "black")
                # the_piece = Piece.create(url:"", player: player2, color: "black")
                Move.create!(done: false, read: true, aggressive: false, start_square: shobu_matrix[board_id][row_id][3], end_square: shobu_matrix[board_id][row_id][3], piece: the_piece)
            end
        end
    end
end