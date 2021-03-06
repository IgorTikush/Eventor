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

ActiveRecord::Schema.define(version: 2021_04_21_110611) do

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "time"
    t.string "place"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "creator_id"
    t.index ["creator_id"], name: "index_events_on_creator_id"
  end

  create_table "participations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "attendee_id", null: false
    t.integer "attended_event_id", null: false
    t.index ["attended_event_id"], name: "index_participations_on_attended_event_id"
    t.index ["attendee_id"], name: "index_participations_on_attendee_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "events", "users", column: "creator_id"
  add_foreign_key "participations", "events", column: "attended_event_id"
  add_foreign_key "participations", "users", column: "attendee_id"
end
