class CreateMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.boolean :done
      t.boolean :read
      t.boolean :aggressive
      t.integer :start_square_id
      t.integer :end_square_id
      t.integer :piece_id
    end
  end
end
