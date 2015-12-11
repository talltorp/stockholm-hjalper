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

ActiveRecord::Schema.define(version: 20151211133404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "available_pickup_times", force: :cascade do |t|
    t.string  "day"
    t.string  "time_span"
    t.integer "campaign_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.integer  "funding_goal"
    t.boolean  "fully_funded"
    t.string   "title"
    t.string   "contact_person"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.text     "body_text"
    t.text     "preamble"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "expired"
    t.datetime "end_date"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "donations", force: :cascade do |t|
    t.integer  "donation_amount"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "campaign_id"
    t.string   "requested_pickup_time"
  end

  add_index "donations", ["campaign_id"], name: "index_donations_on_campaign_id", using: :btree

  create_table "drop_off_locations", force: :cascade do |t|
    t.string  "name"
    t.string  "address"
    t.text    "opening_hours"
    t.integer "campaign_id"
  end

  add_index "drop_off_locations", ["campaign_id"], name: "index_drop_off_locations_on_campaign_id", using: :btree

  add_foreign_key "donations", "campaigns"
end
