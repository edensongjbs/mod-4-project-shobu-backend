class CreatePieces < ActiveRecord::Migration[6.0]
  def change
    create_table :pieces do |t|
      t.string :url
      t.string :rotation , default "0deg"
      t.string :player_id
      t.string :color
    end
  end
end
