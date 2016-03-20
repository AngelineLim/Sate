# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160319220442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "event_id"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["event_id"], name: "index_comments_on_event_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "place"
    t.text     "description"
    t.datetime "end_time"
    t.string   "organisation"
    t.integer  "like"
    t.integer  "lat"
    t.integer  "long"
    t.string   "imageurl"
    t.datetime "start_time"
    t.string   "org_link"
    t.string   "photo_filename"
    t.string   "photo_content_type"
    t.binary   "photo_binary_data"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "page_link"
    t.integer  "web_user_id"
  end

  add_index "events", ["web_user_id"], name: "index_events_on_web_user_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "username"
    t.string   "company"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "web_users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "company"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "events", "web_users"
end
