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

ActiveRecord::Schema.define(version: 20171204103314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "awards", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "valid_until"
    t.string "code"
    t.bigint "partner_id"
    t.bigint "challenge_id"
    t.integer "level"
    t.date "user_notified_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_awards_on_challenge_id"
    t.index ["partner_id"], name: "index_awards_on_partner_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "gender"
    t.bigint "category_id"
    t.datetime "start"
    t.datetime "end"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_challenges_on_category_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participation_rewards", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "valid_until"
    t.string "code"
    t.bigint "partner_id"
    t.bigint "challenge_id"
    t.integer "amount"
    t.integer "distributed_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_participation_rewards_on_challenge_id"
    t.index ["partner_id"], name: "index_participation_rewards_on_partner_id"
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  add_foreign_key "awards", "challenges"
  add_foreign_key "awards", "partners"
  add_foreign_key "challenges", "categories"
  add_foreign_key "participation_rewards", "challenges"
  add_foreign_key "participation_rewards", "partners"
end
