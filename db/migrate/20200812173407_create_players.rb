class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :username
      t.string :url
      t.integer :points, default: 0
      t.string :password_digest
      t.integer :game_id
      t.boolean :primary
    end
  end
end
