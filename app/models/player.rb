class Player < ApplicationRecord
    belongs_to :game
    has_many :pieces
    has_many :moves, through: :pieces
end
  