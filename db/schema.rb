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

ActiveRecord::Schema.define(version: 20131023220142) do

  create_table "cartoons", force: true do |t|
    t.string   "title"
    t.string   "genre"
    t.text     "description"
    t.string   "created_by"
    t.string   "language"
    t.string   "country_of_origin"
    t.integer  "no_of_seasons"
    t.integer  "no_of_episodes"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characters", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "role"
    t.string   "first_appearance"
    t.string   "occupation"
    t.string   "spouse"
    t.string   "religion"
    t.string   "children"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cartoon_id"
  end

  create_table "episodes", force: true do |t|
    t.string   "name"
    t.integer  "episode_number"
    t.integer  "season_number"
    t.string   "guest_actors"
    t.text     "plot"
    t.text     "background"
    t.text     "review"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cartoon_id"
  end

end