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

ActiveRecord::Schema[7.0].define(version: 2023_07_27_152454) do
  create_table "plant_biologies", force: :cascade do |t|
    t.string "name"
    t.string "family"
    t.string "light"
    t.string "humidity"
    t.integer "root_diameter"
    t.string "root_depth"
    t.integer "maximum_temperature"
    t.integer "minimun_temperature"
    t.integer "germation_temperature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plant_crops", force: :cascade do |t|
    t.string "name"
    t.string "month"
    t.string "moon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "\"plant_biology_id\"", name: "index_plant_crops_on_plant_biology_id"
  end

end
