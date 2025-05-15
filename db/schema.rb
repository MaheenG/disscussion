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

ActiveRecord::Schema[8.0].define(version: 2025_05_15_162520) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "admin_permissions", force: :cascade do |t|
    t.bigint "admin_id", null: false
    t.bigint "discussion_id"
    t.bigint "reply_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_admin_permissions_on_admin_id"
    t.index ["discussion_id"], name: "index_admin_permissions_on_discussion_id"
    t.index ["reply_id"], name: "index_admin_permissions_on_reply_id"
  end

  create_table "channels", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discussions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "channel_id", null: false
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_discussions_on_channel_id"
    t.index ["user_id"], name: "index_discussions_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "replies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "discussion_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discussion_id"], name: "index_replies_on_discussion_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "slugs", force: :cascade do |t|
    t.bigint "discussion_id", null: false
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discussion_id"], name: "index_slugs_on_discussion_id"
  end

  create_table "syntax_highlights", force: :cascade do |t|
    t.integer "content_id"
    t.string "content_type"
    t.text "code"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id", "content_type"], name: "index_syntax_highlights_on_content_id_and_content_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "admin_permissions", "discussions"
  add_foreign_key "admin_permissions", "replies"
  add_foreign_key "admin_permissions", "users", column: "admin_id"
  add_foreign_key "discussions", "channels"
  add_foreign_key "discussions", "users"
  add_foreign_key "replies", "discussions"
  add_foreign_key "replies", "users"
  add_foreign_key "slugs", "discussions"
end
