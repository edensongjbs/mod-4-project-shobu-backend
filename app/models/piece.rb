class Piece < ApplicationRecord
    belongs_to :player
    has_many :moves

    def game
        self.player.game
    end

    def dead?
        if (self.moves.length > 0)
            return current_square == self.game.dead_square
        else
            return false
        end
    end

    def current_square
        self.moves.last.end_square
    end
end
  