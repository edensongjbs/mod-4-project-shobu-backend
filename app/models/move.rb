class Move < ApplicationRecord
    belongs_to :start_square, class_name: 'Square'
    belongs_to :end_square, class_name: 'Square'
    belongs_to :piece
end
  