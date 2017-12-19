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

ActiveRecord::Schema.define(version: 20171218182727) do

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
    t.bigint "style_id"
    t.index ["challenge_id"], name: "index_awards_on_challenge_id"
    t.index ["partner_id"], name: "index_awards_on_partner_id"
    t.index ["style_id"], name: "index_awards_on_style_id"
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
    t.bigint "participation_reward_id"
    t.index ["category_id"], name: "index_challenges_on_category_id"
    t.index ["participation_reward_id"], name: "index_challenges_on_participation_reward_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "style_id"
    t.bigint "user_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["style_id"], name: "index_comments_on_style_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "followings", force: :cascade do |t|
    t.integer "following_user_id"
    t.integer "followed_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participation_rewards", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "valid_until"
    t.string "code"
    t.bigint "partner_id"
    t.integer "amount"
    t.integer "distributed_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "styles", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.bigint "challenge_id"
    t.integer "count_of_comments", default: 0
    t.integer "count_of_wows", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_styles_on_challenge_id"
    t.index ["user_id"], name: "index_styles_on_user_id"
  end

  create_table "user_actions", force: :cascade do |t|
    t.string "action_type"
    t.bigint "user_id"
    t.bigint "style_id"
    t.bigint "comment_id"
    t.bigint "wow_id"
    t.bigint "following_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_user_actions_on_comment_id"
    t.index ["following_id"], name: "index_user_actions_on_following_id"
    t.index ["style_id"], name: "index_user_actions_on_style_id"
    t.index ["user_id"], name: "index_user_actions_on_user_id"
    t.index ["wow_id"], name: "index_user_actions_on_wow_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.integer "score", default: 0
    t.string "auth_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wows", force: :cascade do |t|
    t.integer "user_id"
    t.integer "style_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "awards", "challenges"
  add_foreign_key "awards", "partners"
  add_foreign_key "awards", "styles"
  add_foreign_key "challenges", "categories"
  add_foreign_key "challenges", "participation_rewards"
  add_foreign_key "comments", "styles"
  add_foreign_key "comments", "users"
  add_foreign_key "participation_rewards", "partners"
  add_foreign_key "styles", "challenges"
  add_foreign_key "styles", "users"
  add_foreign_key "user_actions", "comments"
  add_foreign_key "user_actions", "followings"
  add_foreign_key "user_actions", "styles"
  add_foreign_key "user_actions", "users"
  add_foreign_key "user_actions", "wows"
end
