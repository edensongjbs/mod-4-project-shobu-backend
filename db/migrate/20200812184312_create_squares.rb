class CreateSquares < ActiveRecord::Migration[6.0]
  def change
    create_table :squares do |t|
      t.string :coordinates
      t.integer :board_id
    end
  end
end
