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

ActiveRecord::Schema.define(version: 20140812180355) do

  create_table "posts", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "news",        default: false
    t.boolean  "blog",        default: false
    t.boolean  "nutrition",   default: false
    t.boolean  "training",    default: false
    t.boolean  "supplements", default: false
    t.string   "title"
  end

  add_index "posts", ["user_id", "created_at"], name: "index_posts_on_user_id_and_created_at"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "remember_token"
    t.boolean  "admin",                 default: false
    t.string   "mealplan_file_name"
    t.string   "mealplan_content_type"
    t.integer  "mealplan_file_size"
    t.datetime "mealplan_updated_at"
    t.integer  "age"
    t.string   "sex"
    t.integer  "height"
    t.string   "goal"
    t.string   "job_type"
    t.string   "work_schedule"
    t.integer  "current_weight"
    t.integer  "desired_weight"
    t.integer  "meals_per_day"
    t.integer  "snacks_per_day"
    t.integer  "body_fat_pct"
    t.string   "plan_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
