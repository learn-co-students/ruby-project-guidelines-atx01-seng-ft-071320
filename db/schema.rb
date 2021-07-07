# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 5) do

  create_table "answers", force: :cascade do |t|
    t.integer "question_id"
    t.string "answer"
    t.boolean "correct", default: false
  end

  create_table "game_questions", force: :cascade do |t|
    t.integer "game_id"
    t.integer "question_id_one"
    t.integer "question_id_two"
    t.integer "question_id_three"
    t.integer "question_id_four"
    t.integer "question_id_five"
    t.integer "question_id_six"
    t.integer "question_id_seven"
    t.integer "question_id_eight"
    t.integer "question_id_nine"
    t.integer "question_id_ten"
  end

  create_table "games", force: :cascade do |t|
    t.integer "user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "category"
    t.string "question"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "high_score", default: 0
  end

end
