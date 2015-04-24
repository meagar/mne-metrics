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

ActiveRecord::Schema.define(version: 20150424182939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.datetime "starts_at"
    t.integer  "team"
    t.string   "description"
    t.string   "description_link"
    t.string   "metrics_impact"
    t.string   "results"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "news_letter_events", force: :cascade do |t|
    t.integer  "news_letter_id"
    t.integer  "event_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "news_letter_events", ["event_id"], name: "index_news_letter_events_on_event_id", using: :btree
  add_index "news_letter_events", ["news_letter_id"], name: "index_news_letter_events_on_news_letter_id", using: :btree

  create_table "news_letters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "news_letter_events", "events"
  add_foreign_key "news_letter_events", "news_letters"
end
