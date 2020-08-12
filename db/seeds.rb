# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Game.destroy_all
Board.destroy_all
Move.destroy_all
Piece.destroy_all
Player.destroy_all
Square.destroy_all


shobu_matrix = [
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

shobu = Game.create(url:"shobu")

shobu_board = []

4.times do |i| 
    shobu_board << Board.create(game: shobu, quadrant:i, description:"")
end

shobu_board.each_with_index do |board, board_index|
    4.times do |i1|
        4.times do |i2|
            coords = "#{i1}#{i2}"
            shobu_matrix[board_index][i1][i2] = Square.create(board: board, coordinates: coords)
        end
    end
end



player1 = Player.create(name: "Anna", game: shobu, username: "player1", url: "player1", primary: true)
player2 = Player.create(name: "James", game: shobu, username: "player2", url: "player2", primary: false)


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

