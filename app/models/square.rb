class Square < ApplicationRecord
    belongs_to :board
    has_many :moves, foreign_key: :start_square
    has_many :moves, foreign_key: :end_square
end
  