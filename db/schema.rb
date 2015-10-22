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

ActiveRecord::Schema.define(version: 20151016065427) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "themes", force: :cascade do |t|
    t.string   "name"
    t.string   "class_name"
    t.boolean  "active",        default: false
    t.text     "thumbnail_url"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "themes", ["class_name"], name: "index_themes_on_class_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "phone"
    t.text     "biography"
    t.string   "avatar"
    t.string   "bre_number"
    t.string   "broker_logo"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  create_table "videos", force: :cascade do |t|
    t.integer  "theme_id"
    t.integer  "user_id"
    t.string   "location"
    t.string   "title"
    t.string   "background_color"
    t.string   "stream_url"
    t.string   "url_sd"
    t.string   "url_hd"
    t.integer  "duration"
    t.string   "thumbnail_url"
    t.string   "hal_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "videos", ["hal_id"], name: "index_videos_on_hal_id", using: :btree
  add_index "videos", ["location"], name: "index_videos_on_location", using: :btree
  add_index "videos", ["theme_id"], name: "index_videos_on_theme_id", using: :btree
  add_index "videos", ["user_id"], name: "index_videos_on_user_id", using: :btree

end
