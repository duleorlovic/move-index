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

ActiveRecord::Schema.define(version: 20170814075258) do

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

  create_table "check_points", force: :cascade do |t|
    t.bigint "discipline_id"
    t.integer "distance"
    t.integer "order"
    t.index ["discipline_id"], name: "index_check_points_on_discipline_id"
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "name", null: false
    t.integer "gender"
    t.integer "distance_m"
    t.integer "age_min"
    t.integer "age_max"
    t.integer "number_of_crew"
    t.bigint "sport_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_disciplines_on_event_id"
    t.index ["sport_id"], name: "index_disciplines_on_sport_id"
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
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_events_on_organization_id"
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer "resource_owner_id", null: false
    t.bigint "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes"
    t.index ["application_id"], name: "index_oauth_access_grants_on_application_id"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer "resource_owner_id"
    t.bigint "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "organization_sports", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "sport_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id", "sport_id"], name: "index_organization_sports_on_organization_id_and_sport_id", unique: true
    t.index ["organization_id"], name: "index_organization_sports_on_organization_id"
    t.index ["sport_id"], name: "index_organization_sports_on_sport_id"
  end

  create_table "organization_users", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "user_id", null: false
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

  create_table "participations", force: :cascade do |t|
    t.bigint "race_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_participations_on_race_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.datetime "starts_at"
    t.integer "category"
    t.bigint "discipline_id", null: false
    t.index ["discipline_id"], name: "index_races_on_discipline_id"
  end

  create_table "registration_participations", force: :cascade do |t|
    t.bigint "registration_id"
    t.bigint "participation_id"
    t.index ["participation_id"], name: "index_registration_participations_on_participation_id"
    t.index ["registration_id", "participation_id"], name: "i_registration_participations_uniq", unique: true
    t.index ["registration_id"], name: "index_registration_participations_on_registration_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "discipline_id", null: false
    t.integer "status"
    t.string "tshirt_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipline_id"], name: "index_registrations_on_discipline_id"
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "results", force: :cascade do |t|
    t.bigint "participation_id", null: false
    t.bigint "check_point_id", null: false
    t.float "time_in_s"
    t.index ["check_point_id"], name: "index_results_on_check_point_id"
    t.index ["participation_id", "check_point_id"], name: "index_results_on_participation_id_and_check_point_id", unique: true
    t.index ["participation_id"], name: "index_results_on_participation_id"
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
  add_foreign_key "check_points", "disciplines"
  add_foreign_key "disciplines", "events"
  add_foreign_key "disciplines", "sports"
  add_foreign_key "events", "organizations"
  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "organization_sports", "organizations"
  add_foreign_key "organization_sports", "sports"
  add_foreign_key "organization_users", "organizations"
  add_foreign_key "organization_users", "users"
  add_foreign_key "participations", "races"
  add_foreign_key "races", "disciplines"
  add_foreign_key "registration_participations", "participations"
  add_foreign_key "registration_participations", "registrations"
  add_foreign_key "registrations", "disciplines"
  add_foreign_key "registrations", "users"
  add_foreign_key "results", "check_points"
  add_foreign_key "results", "participations"
end
