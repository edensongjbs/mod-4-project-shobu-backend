# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_12_205918) do

  create_table "boards", force: :cascade do |t|
    t.integer "quadrant"
    t.string "description"
    t.integer "game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "url"
    t.string "current_board_json"
  end

  create_table "moves", force: :cascade do |t|
    t.boolean "done"
    t.boolean "read"
    t.boolean "aggressive"
    t.string "start_square_id"
    t.string "end_square_id"
    t.string "piece_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.string "url"
    t.string "rotation", default: "0deg"
    t.string "player_id"
    t.string "color"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "url"
    t.integer "points", default: 0
    t.string "password_digest"
    t.string "game_id"
    t.boolean "primary"
  end

  create_table "squares", force: :cascade do |t|
    t.string "coordinates"
    t.string "board_id"
  end

end
