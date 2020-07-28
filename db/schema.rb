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

ActiveRecord::Schema.define(version: 2020_07_28_184054) do

  create_table "entries", force: :cascade do |t|
    t.integer "journal_id"
    t.integer "user_id"
    t.text "entry_text"
  end

  create_table "journals", force: :cascade do |t|
    t.string "journal_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
  end

end
