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

ActiveRecord::Schema.define(version: 20131203154254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.integer  "user_id"
    t.string   "uid"
    t.string   "username"
    t.string   "provider"
    t.string   "oauth_token"
    t.string   "oauth_secret"
    t.datetime "oauth_expires"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meetups", force: true do |t|
    t.integer  "offering_id"
    t.integer  "learner_id"
    t.string   "method"
    t.datetime "date_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "accepted"
    t.boolean  "cancelled"
    t.datetime "time1"
    t.datetime "time2"
    t.datetime "time3"
  end

  create_table "offerings", force: true do |t|
    t.integer  "subject_id"
    t.integer  "teacher_id"
    t.boolean  "hangout"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "details"
  end

  create_table "ratings", force: true do |t|
    t.integer  "score"
    t.text     "review"
    t.integer  "meetup_id"
    t.integer  "learner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "bio"
    t.integer  "credit",          default: 0
  end

end
