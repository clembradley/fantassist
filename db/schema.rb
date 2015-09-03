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

ActiveRecord::Schema.define(version: 20150902190914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "draft_picks", force: :cascade do |t|
    t.integer  "drafter_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "draft_picks", ["drafter_id", "player_id"], name: "index_draft_picks_on_drafter_id_and_player_id", unique: true, using: :btree
  add_index "draft_picks", ["drafter_id"], name: "index_draft_picks_on_drafter_id", using: :btree
  add_index "draft_picks", ["player_id"], name: "index_draft_picks_on_player_id", using: :btree

  create_table "drafters", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "league_id",  null: false
  end

  add_index "drafters", ["league_id", "user_id"], name: "index_drafters_on_league_id_and_user_id", unique: true, using: :btree
  add_index "drafters", ["league_id"], name: "index_drafters_on_league_id", using: :btree
  add_index "drafters", ["user_id"], name: "index_drafters_on_user_id", using: :btree

  create_table "leagues", force: :cascade do |t|
    t.string "name"
  end

  create_table "players", force: :cascade do |t|
    t.string   "first_name",   limit: 255, null: false
    t.string   "last_name",    limit: 255, null: false
    t.string   "position",     limit: 255, null: false
    t.string   "organization", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stats", force: :cascade do |t|
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
    t.integer  "year",                              null: false
    t.boolean  "projection",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "walks_given_up"
    t.integer  "walks_drawn"
    t.integer  "hits_given_up"
    t.integer  "plate_appearances"
    t.integer  "hit_by_pitch"
    t.integer  "games_played"
  end

  add_index "stats", ["player_id"], name: "index_stats_on_player_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",              limit: 255,             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider",           limit: 255
    t.string   "uid",                limit: 255
    t.string   "image",              limit: 255
    t.string   "first_name",         limit: 255
    t.string   "last_name",          limit: 255
    t.integer  "sign_in_count",                  default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip", limit: 255
    t.string   "last_sign_in_ip",    limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree

end
