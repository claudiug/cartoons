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

ActiveRecord::Schema.define(version: 20131030001916) do

  create_table "accounts", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "announcements", force: true do |t|
    t.text     "message"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "slug"
  end

  add_index "cartoons", ["slug"], name: "index_cartoons_on_slug"

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
    t.string   "slug"
  end

  add_index "characters", ["slug"], name: "index_characters_on_slug"

  create_table "characters_episodes", force: true do |t|
    t.integer "character_id"
    t.integer "episode_id"
  end

  create_table "comments", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "is_active",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "content"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
  add_index "comments", ["name"], name: "index_comments_on_name"

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
    t.string   "slug"
    t.boolean  "draft"
  end

  add_index "episodes", ["slug"], name: "index_episodes_on_slug"

  create_table "quotes", force: true do |t|
    t.text     "content"
    t.integer  "character_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "quotes", ["slug"], name: "index_quotes_on_slug"

  create_table "seasons", force: true do |t|
    t.string   "name"
    t.integer  "cartoon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: true do |t|
    t.string   "title"
    t.string   "link"
    t.integer  "episode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "songs", ["slug"], name: "index_songs_on_slug"

end
