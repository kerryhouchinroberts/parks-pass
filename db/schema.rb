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

ActiveRecord::Schema.define(version: 20150607050902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parks", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "established"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "main_image"
    t.integer  "rec_id"
    t.string   "dropbox"
  end

  create_table "trips", force: :cascade do |t|
    t.date    "start_date"
    t.date    "end_date"
    t.text    "notes"
    t.json    "park_photos"
    t.integer "user_id"
    t.integer "park_id"
  end

  add_index "trips", ["park_id"], name: "index_trips_on_park_id", using: :btree
  add_index "trips", ["user_id"], name: "index_trips_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string "oauth_user_id"
    t.string "token"
    t.string "name"
    t.string "image_url"
  end

  add_foreign_key "trips", "parks"
  add_foreign_key "trips", "users"
end
