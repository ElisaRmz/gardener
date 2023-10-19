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

ActiveRecord::Schema[7.0].define(version: 2023_10_16_151135) do
  create_table "lands", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lands_on_user_id"
  end

  create_table "plant_cares", force: :cascade do |t|
    t.string "name"
    t.string "month"
    t.string "moon"
    t.integer "plant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_plant_cares_on_plant_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.string "family"
    t.string "light"
    t.string "humidity"
    t.string "root_depth"
    t.integer "root_diameter"
    t.integer "maximum_temperature"
    t.integer "minimum_temperature"
    t.integer "germination_temperature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seeded_plant_care_tasks", force: :cascade do |t|
    t.datetime "done"
    t.integer "seeded_plant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seeded_plant_id"], name: "index_seeded_plant_care_tasks_on_seeded_plant_id"
  end

  create_table "seeded_plants", force: :cascade do |t|
    t.string "description"
    t.integer "land_id"
    t.integer "plant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["land_id"], name: "index_seeded_plants_on_land_id"
    t.index ["plant_id"], name: "index_seeded_plants_on_plant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "lands", "users"
  add_foreign_key "plant_cares", "plants"
  add_foreign_key "seeded_plant_care_tasks", "seeded_plants"
  add_foreign_key "seeded_plants", "lands"
  add_foreign_key "seeded_plants", "plants"
end
