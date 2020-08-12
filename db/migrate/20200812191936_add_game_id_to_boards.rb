class AddGameIdToBoards < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :game_id, :integer
  end
end
