# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_01_27_224832) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attending_artist_festivals", force: :cascade do |t|
    t.bigint "festival_id", null: false
    t.bigint "attending_artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.index ["attending_artist_id"], name: "index_attending_artist_festivals_on_attending_artist_id"
    t.index ["festival_id"], name: "index_attending_artist_festivals_on_festival_id"
  end

  create_table "attending_artists", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "festivals", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.string "location"
    t.string "imageURL"
  end

  create_table "user_festivals", force: :cascade do |t|
    t.bigint "festival_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["festival_id"], name: "index_user_festivals_on_festival_id"
    t.index ["user_id"], name: "index_user_festivals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
  end

  add_foreign_key "attending_artist_festivals", "attending_artists"
  add_foreign_key "attending_artist_festivals", "festivals"
  add_foreign_key "user_festivals", "festivals"
  add_foreign_key "user_festivals", "users"
end
