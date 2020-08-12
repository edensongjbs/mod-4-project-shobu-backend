class CreateMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.boolean :done
      t.boolean :read
      t.boolean :aggressive
      t.string :start_square_id
      t.string :end_square_id
      t.string :piece_id
    end
  end
end
