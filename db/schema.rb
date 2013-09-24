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

ActiveRecord::Schema.define(version: 20130921135930) do

  create_table "content_items", force: true do |t|
    t.string   "title"
    t.string   "teaser"
    t.string   "required_action"
    t.string   "link"
    t.string   "payout"
    t.text     "time_to_payout"
    t.integer  "offer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "offer_types"
    t.text     "thumbnail"
  end

  create_table "offers", force: true do |t|
    t.string   "uid"
    t.string   "pub0"
    t.integer  "page"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "locale"
    t.datetime "request_timestamp"
  end

end
