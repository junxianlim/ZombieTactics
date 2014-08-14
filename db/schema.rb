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

ActiveRecord::Schema.define(version: 20140814065932) do

  create_table "characters", force: true do |t|
    t.integer  "team_id"
    t.string   "type"
    t.integer  "action_points_left"
    t.integer  "speed"
    t.integer  "life_points_left"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.integer  "player1_id"
    t.integer  "player2_id"
    t.integer  "map_id"
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.integer  "current_turn_team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gridfields", force: true do |t|
    t.integer  "map_id"
    t.integer  "x"
    t.integer  "y"
    t.integer  "grid_object_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gridobjects", force: true do |t|
    t.boolean  "traversible?"
    t.string   "graphic_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maps", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["email"], name: "index_players_on_email", unique: true
  add_index "players", ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end