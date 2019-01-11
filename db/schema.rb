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

ActiveRecord::Schema.define(version: 2019_01_11_043942) do

  create_table "attendees", force: :cascade do |t|
    t.string "name"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_attendees_on_event_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "is_public"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.integer "category_id"
    t.index ["category_id"], name: "index_events_on_category_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rcr_request_attachments", force: :cascade do |t|
    t.integer "rcr_request_id"
    t.string "name", null: false
    t.string "path", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rcr_request_id"], name: "index_rcr_request_attachments_on_rcr_request_id"
  end

  create_table "rcr_requests", force: :cascade do |t|
    t.string "request_type", null: false
    t.text "public_key", null: false
    t.string "account_number", null: false
    t.string "status", null: false
    t.string "owner_group"
    t.datetime "created_at", null: false
    t.string "created_by", null: false
    t.datetime "updated_at", null: false
    t.string "updated_by"
    t.datetime "primary_approved_at"
    t.string "primary_approved_by"
    t.text "primary_approved_comment"
    t.datetime "denied_at"
    t.string "denied_by"
    t.text "denied_comment"
  end

end
