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

ActiveRecord::Schema.define(version: 2021_05_27_114912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cinema_halls", force: :cascade do |t|
    t.string "hall_name"
    t.integer "volume"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tickets_id_id"
    t.index ["tickets_id_id"], name: "index_cinema_halls_on_tickets_id_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "genre"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "ticket_desk_id"
    t.bigint "seance_id"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["seance_id"], name: "index_reservations_on_seance_id"
    t.index ["ticket_desk_id"], name: "index_reservations_on_ticket_desk_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "seances", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "movie_id", null: false
    t.bigint "cinema_hall_id", null: false
    t.time "start_time"
    t.index ["cinema_hall_id"], name: "index_seances_on_cinema_hall_id"
    t.index ["movie_id"], name: "index_seances_on_movie_id"
  end

  create_table "ticket_desks", force: :cascade do |t|
    t.string "name"
    t.boolean "online"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tickets_id_id"
    t.index ["tickets_id_id"], name: "index_ticket_desks_on_tickets_id_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "reservation_id", null: false
    t.string "sort"
    t.integer "price"
    t.integer "seat"
    t.index ["reservation_id"], name: "index_tickets_on_reservation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.boolean "real_user"
    t.text "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "reservations", "users"
  add_foreign_key "seances", "cinema_halls"
  add_foreign_key "seances", "movies"
  add_foreign_key "tickets", "reservations"
end
