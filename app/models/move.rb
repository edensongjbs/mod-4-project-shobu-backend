class Move < ApplicationRecord
    belongs_to :square, foreign_key: :start_square
    belongs_to :square, foreign_key: :end_square
    belongs_to :piece
end
  