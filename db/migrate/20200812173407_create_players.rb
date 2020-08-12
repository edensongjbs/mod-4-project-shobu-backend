class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :username
      t.string :url
      t.integer :points
      t.string :password_digest
      t.string :game_id
      t.boolean :primary
    end
  end
end
