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

ActiveRecord::Schema.define(version: 20170809123658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "icon_url"
    t.index ["name"], name: "index_activities_on_name", unique: true
  end

  create_table "activity_sports", force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.bigint "sport_id", null: false
    t.index ["activity_id", "sport_id"], name: "index_activity_sports_on_activity_id_and_sport_id", unique: true
    t.index ["activity_id"], name: "index_activity_sports_on_activity_id"
    t.index ["sport_id"], name: "index_activity_sports_on_sport_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "starts_at", null: false
    t.datetime "ends_at"
    t.datetime "registration_opens_at"
    t.datetime "registration_ends_at"
    t.string "email"
    t.string "website"
    t.integer "status"
    t.float "latitude"
    t.float "longitude"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_events_on_organization_id"
  end

  create_table "organization_sports", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id", "sport_id"], name: "index_organization_sports_on_organization_id_and_sport_id", unique: true
    t.index ["organization_id"], name: "index_organization_sports_on_organization_id"
    t.index ["sport_id"], name: "index_organization_sports_on_sport_id"
  end

  create_table "organization_users", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "user_id"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id", "user_id"], name: "index_organization_users_on_organization_id_and_user_id", unique: true
    t.index ["organization_id"], name: "index_organization_users_on_organization_id"
    t.index ["user_id"], name: "index_organization_users_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.integer "category"
    t.string "username"
    t.datetime "birth_date"
    t.text "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zip"
    t.string "website"
    t.string "email"
    t.string "phone_number"
    t.string "mobile_phone_number"
    t.string "national_registration_id"
    t.integer "status"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sports", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "icon_url"
    t.index ["name"], name: "index_sports_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activity_sports", "activities"
  add_foreign_key "activity_sports", "sports"
end
