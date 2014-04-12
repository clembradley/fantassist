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

ActiveRecord::Schema.define(version: 20140412201636) do

  create_table "players", force: true do |t|
    t.string   "first_name",   null: false
    t.string   "last_name",    null: false
    t.string   "position",     null: false
    t.string   "organization", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stats", force: true do |t|
    t.integer  "player_id"
    t.integer  "at_bats"
    t.integer  "hits"
    t.integer  "home_runs"
    t.integer  "rbis"
    t.integer  "runs"
    t.integer  "stolen_bases"
    t.integer  "innings_pitched"
    t.integer  "earned_runs"
    t.integer  "strikeouts"
    t.integer  "quality_starts"
    t.integer  "wins"
    t.integer  "saves"
    t.integer  "year",                            null: false
    t.boolean  "projection",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stats", ["player_id"], name: "index_stats_on_player_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
