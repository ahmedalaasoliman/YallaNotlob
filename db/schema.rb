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

ActiveRecord::Schema.define(version: 20160428182824) do

  create_table "friends", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "friend",     limit: 4
    t.string   "group",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "friends", ["user_id"], name: "index_friends_on_user_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "item_name",  limit: 255
    t.integer  "amount",     limit: 4
    t.integer  "price",      limit: 4
    t.string   "comment",    limit: 255
    t.integer  "user_id",    limit: 4
    t.integer  "order_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "items", ["order_id"], name: "index_items_on_order_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "order_users", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "userstatus", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "order_users", ["order_id"], name: "index_order_users_on_order_id", using: :btree
  add_index "order_users", ["user_id"], name: "index_order_users_on_user_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "order_for",  limit: 255
    t.string   "order_from", limit: 255
    t.string   "menu_image", limit: 255
    t.string   "status",     limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "friends", "users"
  add_foreign_key "items", "orders"
  add_foreign_key "items", "users"
  add_foreign_key "order_users", "orders"
  add_foreign_key "order_users", "users"
  add_foreign_key "orders", "users"
end