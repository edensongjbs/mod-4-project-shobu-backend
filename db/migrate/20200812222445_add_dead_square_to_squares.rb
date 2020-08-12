class AddDeadSquareToSquares < ActiveRecord::Migration[6.0]
  def change
    add_column :squares, :dead_square, :boolean, default: false
  end
end
