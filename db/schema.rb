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

ActiveRecord::Schema.define(version: 2020_11_05_210830) do

  create_table "diets", force: :cascade do |t|
    t.string "goal"
    t.date "start_date"
    t.date "end_date"
    t.integer "current_weight"
    t.integer "target_weight"
    t.integer "user_id", null: false
    t.integer "activity_level"
    t.index ["user_id"], name: "index_diets_on_user_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.integer "carbs"
    t.integer "fat"
    t.integer "protein"
    t.integer "user_id", null: false
    t.integer "meal_id"
    t.integer "serving_size"
    t.index ["meal_id"], name: "index_foods_on_meal_id"
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.integer "carbs"
    t.integer "fat"
    t.integer "protein"
  end

  create_table "user_stats", force: :cascade do |t|
    t.string "sex"
    t.integer "height_inches"
    t.date "birthday"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_user_stats_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "diets", "users"
  add_foreign_key "foods", "meals"
  add_foreign_key "foods", "users"
  add_foreign_key "user_stats", "users"
end
