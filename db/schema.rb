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

ActiveRecord::Schema.define(version: 20220122174935) do

  create_table "admins", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

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

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "designations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "designations_forums", force: :cascade do |t|
    t.integer  "designation_id"
    t.integer  "forum_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "designations_notifications", force: :cascade do |t|
    t.integer  "designation_id"
    t.integer  "notification_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forum_replays", force: :cascade do |t|
    t.text     "answer"
    t.integer  "forum_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forums", force: :cascade do |t|
    t.text     "question"
    t.boolean  "is_closed",   default: false
    t.boolean  "is_approved", default: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.datetime "closed_at"
  end

  create_table "gallaries", force: :cascade do |t|
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size",    limit: 8
    t.datetime "photo_updated_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "title"
  end

  create_table "mcs_infos", force: :cascade do |t|
    t.string   "info_type"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size",    limit: 8
    t.datetime "attachment_updated_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "notification_type"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size",    limit: 8
    t.datetime "attachment_updated_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "phonebooks", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "present_postings", force: :cascade do |t|
    t.string   "name"
    t.integer  "designation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "designation"
    t.string   "education"
    t.string   "phone_no"
    t.string   "mobile_no1",                      default: "",   null: false
    t.string   "mobile_no2"
    t.string   "email"
    t.string   "home_taluka_id"
    t.date     "date_of_birth"
    t.date     "date_of_join_dept"
    t.date     "posting_date"
    t.string   "present_post"
    t.string   "home_taluka",                     default: "NA"
    t.string   "home_district",                   default: "NA"
    t.string   "posting_district",                default: "NA"
    t.string   "posting_taluka",                  default: "NA"
    t.string   "batch"
    t.string   "other_info"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size",       limit: 8
    t.datetime "photo_updated_at"
    t.string   "icard_file_name"
    t.string   "icard_content_type"
    t.integer  "icard_file_size",       limit: 8
    t.datetime "icard_updated_at"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "user_id"
    t.date     "date_of_joining_cadra"
    t.text     "past_postings"
    t.text     "additional_info"
    t.text     "achievements"
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"

  create_table "talukas", force: :cascade do |t|
    t.string   "name"
    t.integer  "district_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",               default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "designation"
    t.string   "education"
    t.string   "phone_no"
    t.string   "mobile_no1",                       default: "",   null: false
    t.string   "mobile_no2"
    t.string   "home_taluka",                      default: "NA"
    t.date     "date_of_birth"
    t.date     "date_of_join_dept"
    t.string   "present_post"
    t.string   "posting_taluka",                   default: "NA"
    t.date     "posting_date"
    t.string   "batch"
    t.string   "other_info"
    t.string   "imei_code"
    t.text     "gcm_api_key"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size",        limit: 8
    t.datetime "photo_updated_at"
    t.integer  "approve_status",                   default: 0,    null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "home_district",                    default: "NA"
    t.string   "posting_district",                 default: "NA"
    t.string   "authentication_token"
    t.string   "icard_file_name"
    t.string   "icard_content_type"
    t.integer  "icard_file_size",        limit: 8
    t.datetime "icard_updated_at"
    t.string   "lat"
    t.string   "long"
    t.datetime "approved_at"
    t.string   "sim_number1"
    t.string   "sim_number2"
    t.date     "date_of_joining_cadra"
    t.text     "past_postings"
    t.text     "additional_info"
    t.text     "achievements"
    t.text     "access_permission"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  add_index "users", ["mobile_no1"], name: "index_users_on_mobile_no1", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
