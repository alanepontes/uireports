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

ActiveRecord::Schema.define(version: 20161111232727) do

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"

  create_table "admin_devices", force: :cascade do |t|
    t.string   "name",              default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  create_table "admin_heuristics", force: :cascade do |t|
    t.string   "name",        default: "", null: false
    t.text     "description"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_questions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "heuristic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "educations", force: :cascade do |t|
    t.integer  "degree"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "educations", ["user_id"], name: "index_educations_on_user_id"

  create_table "experiences", force: :cascade do |t|
    t.integer  "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "experiences", ["user_id"], name: "index_experiences_on_user_id"

  create_table "feedback_types", force: :cascade do |t|
    t.string   "info",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "position"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "rate",             null: false
    t.integer  "evaluation_id"
    t.integer  "feedback_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "feedbacks", ["evaluation_id"], name: "index_feedbacks_on_evaluation_id"
  add_index "feedbacks", ["feedback_type_id"], name: "index_feedbacks_on_feedback_type_id"

  create_table "knowledges", force: :cascade do |t|
    t.integer  "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "knowledges", ["user_id"], name: "index_knowledges_on_user_id"

  create_table "languages", force: :cascade do |t|
    t.integer  "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "languages", ["user_id"], name: "index_languages_on_user_id"

  create_table "professions", force: :cascade do |t|
    t.integer  "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "professions", ["user_id"], name: "index_professions_on_user_id"

  create_table "profile_answers", force: :cascade do |t|
    t.boolean  "problem",     default: false, null: false
    t.integer  "level",       default: 0,     null: false
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.integer  "tela_id"
  end

  create_table "profile_evaluations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
  end

  create_table "profile_invites", force: :cascade do |t|
    t.string   "email"
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status",     default: false, null: false
  end

  create_table "profile_projects", force: :cascade do |t|
    t.string   "name",         default: "", null: false
    t.text     "description"
    t.integer  "status",       default: 1,  null: false
    t.integer  "heuristic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "profile_telas", force: :cascade do |t|
    t.string   "tela"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tela_file_name"
    t.string   "tela_content_type"
    t.integer  "tela_file_size"
    t.datetime "tela_updated_at"
    t.integer  "position"
    t.string   "description"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "score",        default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "evaluator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "admin",                  default: false, null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "about",                  default: "",    null: false
    t.integer  "age"
    t.string   "work",                   default: "",    null: false
    t.string   "study",                  default: "",    null: false
    t.text     "country",                default: "",    null: false
    t.text     "city",                   default: "",    null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
