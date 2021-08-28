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

ActiveRecord::Schema.define(version: 2021_08_28_164641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "generics", force: :cascade do |t|
    t.string "prompt", limit: 4096, null: false
    t.string "answer", limit: 4096, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "generics_interviews", id: false, force: :cascade do |t|
    t.bigint "generic_id", null: false
    t.bigint "interview_id", null: false
    t.index ["generic_id", "interview_id"], name: "index_generics_interviews_on_generic_id_and_interview_id", unique: true
  end

  create_table "interviews", force: :cascade do |t|
    t.string "position", limit: 100, null: false
    t.string "company", limit: 100, null: false
    t.date "date", null: false
    t.integer "duration", null: false
    t.string "interviewer", limit: 100, null: false
    t.string "industry", limit: 100, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "my_questions", force: :cascade do |t|
    t.string "prompt", limit: 4096, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "prompt", limit: 4096, null: false
    t.string "answer", limit: 4096, null: false
    t.bigint "interview_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["interview_id"], name: "index_questions_on_interview_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "generics_interviews", "generics"
  add_foreign_key "generics_interviews", "interviews"
  add_foreign_key "questions", "interviews"
end
