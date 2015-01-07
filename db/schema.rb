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

ActiveRecord::Schema.define(version: 20150107034851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "content",    default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "activities_couples", id: false, force: :cascade do |t|
    t.integer "activity_id", null: false
    t.integer "couple_id",   null: false
  end

  create_table "couples", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "couples_users", id: false, force: :cascade do |t|
    t.integer "user_id",   null: false
    t.integer "couple_id", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.integer  "user_id",                 null: false
    t.string   "content",    default: "", null: false
    t.string   "stress",     default: "", null: false
    t.text     "details",    default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "couple_id",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                     default: "", null: false
    t.string   "password_hash", limit: 64
    t.string   "salt",          limit: 32
    t.string   "remember_hash", limit: 60
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "email"
    t.string   "avatar"
    t.string   "location",                 default: "", null: false
    t.string   "timezone",                 default: "", null: false
    t.string   "longitude"
    t.string   "latitude"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree

end
