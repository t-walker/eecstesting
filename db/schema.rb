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

ActiveRecord::Schema.define(version: 20151030195840) do

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "model",        limit: 255
    t.string   "notification", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "model_id",     limit: 4
  end

  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "prompt",        limit: 255
    t.string   "possible1",     limit: 255
    t.string   "possible2",     limit: 255
    t.string   "possible3",     limit: 255
    t.string   "possible4",     limit: 255
    t.string   "correct",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "question_type", limit: 255
    t.integer  "user_id",       limit: 4
    t.string   "detail",        limit: 255
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id", using: :btree

  create_table "questions_testversions", id: false, force: :cascade do |t|
    t.integer "testversion_id", limit: 4
    t.integer "question_id",    limit: 4
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "usertest_id",   limit: 4
    t.string   "response_data", limit: 255
    t.boolean  "correct"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "question_id",   limit: 4
  end

  add_index "responses", ["question_id"], name: "index_responses_on_question_id", using: :btree
  add_index "responses", ["user_id"], name: "index_responses_on_user_id", using: :btree
  add_index "responses", ["usertest_id"], name: "index_responses_on_usertest_id", using: :btree

  create_table "testversions", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "startdate"
    t.datetime "enddate"
    t.boolean  "isopen"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "testversions", ["user_id"], name: "index_testversions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "firstname",              limit: 255
    t.string   "lastname",               limit: 255
    t.string   "studentid",              limit: 255
    t.string   "role",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "usertests", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "score",          limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "testversion_id", limit: 4
  end

  add_index "usertests", ["testversion_id"], name: "index_usertests_on_testversion_id", using: :btree
  add_index "usertests", ["user_id"], name: "index_usertests_on_user_id", using: :btree

  add_foreign_key "notifications", "users"
  add_foreign_key "questions", "users"
  add_foreign_key "responses", "questions"
  add_foreign_key "responses", "users"
  add_foreign_key "responses", "usertests"
  add_foreign_key "testversions", "users"
  add_foreign_key "usertests", "testversions"
  add_foreign_key "usertests", "users"
end
