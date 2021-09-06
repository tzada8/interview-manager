# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_03_024556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "generics", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_generics_on_question_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.string "company", limit: 100, null: false
    t.string "position", limit: 100, null: false
    t.string "industry", limit: 100, null: false
    t.date "date", null: false
    t.integer "duration", null: false
    t.string "interviewer", limit: 100, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_interviews_on_user_id"
  end

  create_table "my_questions", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_my_questions_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "prompt", limit: 4096, null: false
    t.string "answer", limit: 4096
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "specifics", force: :cascade do |t|
    t.bigint "interview_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["interview_id"], name: "index_specifics_on_interview_id"
    t.index ["question_id"], name: "index_specifics_on_question_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name", limit: 50, null: false
    t.string "last_name", limit: 50, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "generics", "questions"
  add_foreign_key "interviews", "users"
  add_foreign_key "my_questions", "questions"
  add_foreign_key "questions", "users"
  add_foreign_key "specifics", "interviews"
  add_foreign_key "specifics", "questions"
end
