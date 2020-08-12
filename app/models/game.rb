class Game < ApplicationRecord
    has_many :boards
    has_many :players
    has_many :pieces, through: :players
    has_many :moves, through: :pieces
    has_many :squares, through: :boards
end
  