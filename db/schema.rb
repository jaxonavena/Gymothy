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

ActiveRecord::Schema[7.1].define(version: 2025_01_15_192913) do
  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "owner_name"
    t.string "owner_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "display_schedule", default: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.integer "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "business_id", null: false
    t.index ["business_id"], name: "index_employees_on_business_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "business_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_events_on_business_id"
  end

  create_table "interests", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "Interested"
    t.index ["event_id"], name: "index_interests_on_event_id"
    t.index ["member_id", "event_id"], name: "index_interests_on_member_id_and_event_id", unique: true
    t.index ["member_id"], name: "index_interests_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "email"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "business_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_memberships_on_business_id"
    t.index ["member_id"], name: "index_memberships_on_member_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "latitude"
    t.string "longitude"
    t.string "address"
    t.string "manager_name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "business_id"
    t.index ["business_id"], name: "index_sites_on_business_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
  end

  add_foreign_key "comments", "articles"
  add_foreign_key "employees", "businesses"
  add_foreign_key "events", "businesses"
  add_foreign_key "interests", "events"
  add_foreign_key "interests", "members"
  add_foreign_key "memberships", "businesses"
  add_foreign_key "memberships", "members"
  add_foreign_key "sites", "businesses"
end
