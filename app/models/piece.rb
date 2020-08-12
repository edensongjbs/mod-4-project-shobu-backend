class Piece < ApplicationRecord
    belongs_to :player
    has_many :moves

    def game
        self.player.game
    end

    def dead?
        current_square == self.game.dead_square
    end

    def current_square
        self.moves.last.end_square
    end
end
  