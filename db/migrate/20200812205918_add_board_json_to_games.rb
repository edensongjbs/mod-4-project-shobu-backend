class AddBoardJsonToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :current_board_json, :string
  end
end
