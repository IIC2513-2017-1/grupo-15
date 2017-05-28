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

ActiveRecord::Schema.define(version: 20170528171807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "project_id"
    t.index ["project_id"], name: "index_comments_on_project_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "following_id", null: false
    t.integer  "follower_id",  null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["follower_id"], name: "index_follows_on_follower_id", using: :btree
    t.index ["following_id", "follower_id"], name: "index_follows_on_following_id_and_follower_id", unique: true, using: :btree
    t.index ["following_id"], name: "index_follows_on_following_id", using: :btree
  end

  create_table "pledges", force: :cascade do |t|
    t.decimal  "amount",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "reward_id"
    t.index ["project_id"], name: "index_pledges_on_project_id", using: :btree
    t.index ["reward_id"], name: "index_pledges_on_reward_id", using: :btree
    t.index ["user_id"], name: "index_pledges_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "start_date",  null: false
    t.datetime "end_date",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "category_id"
    t.index ["category_id"], name: "index_projects_on_category_id", using: :btree
    t.index ["name"], name: "index_projects_on_name", unique: true, using: :btree
    t.index ["user_id"], name: "index_projects_on_user_id", using: :btree
  end

  create_table "rewards", force: :cascade do |t|
    t.string   "title",       null: false
    t.float    "amount",      null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "project_id"
    t.index ["project_id"], name: "index_rewards_on_project_id", using: :btree
  end

  create_table "updates", force: :cascade do |t|
    t.string   "title",       null: false
    t.string   "description", null: false
    t.datetime "date",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "project_id"
    t.index ["project_id"], name: "index_updates_on_project_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",               null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "password_digest"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "comments", "projects"
  add_foreign_key "comments", "users"
  add_foreign_key "pledges", "projects"
  add_foreign_key "pledges", "rewards"
  add_foreign_key "pledges", "users"
  add_foreign_key "projects", "categories"
  add_foreign_key "projects", "users"
  add_foreign_key "rewards", "projects"
  add_foreign_key "updates", "projects"
end
