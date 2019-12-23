# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_23_151129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "licenses", force: :cascade do |t|
    t.bigint "person_id"
    t.string "number"
    t.string "modalities"
    t.date "expiration_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_licenses_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "document"
    t.string "email"
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string "number"
    t.string "code"
    t.string "phone_type"
    t.boolean "preferential"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rentals", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "vehicle_id"
    t.decimal "value", precision: 8, scale: 2
    t.date "start_date"
    t.date "end_date"
    t.date "withdrawal_date"
    t.date "return_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_rentals_on_person_id"
    t.index ["vehicle_id"], name: "index_rentals_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "model"
    t.string "color"
    t.string "year"
    t.string "license_plate"
    t.string "vehicle_type"
    t.decimal "daily_rate", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "licenses", "people"
  add_foreign_key "rentals", "people"
  add_foreign_key "rentals", "vehicles"
end
