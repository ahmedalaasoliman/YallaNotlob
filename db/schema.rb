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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160504141959) do
=======
ActiveRecord::Schema.define(version: 20160502101108) do
>>>>>>> 4dc5c6129bc69a11940df65df2d68802a34ced7a

  create_table "follows", force: :cascade do |t|
    t.integer  "followable_id",   limit: 4,                   null: false
    t.string   "followable_type", limit: 255,                 null: false
    t.integer  "follower_id",     limit: 4,                   null: false
    t.string   "follower_type",   limit: 255,                 null: false
    t.boolean  "blocked",                     default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "friends", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "friend",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "friends", ["user_id"], name: "index_friends_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "gname",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id", using: :btree

  create_table "gusers", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "group_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "gusers", ["group_id"], name: "index_gusers_on_group_id", using: :btree
  add_index "gusers", ["user_id"], name: "index_gusers_on_user_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "item_name",  limit: 255
    t.integer  "amount",     limit: 4
    t.integer  "price",      limit: 4
    t.string   "comment",    limit: 255
    t.integer  "user_id",    limit: 4
    t.integer  "order_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "person",     limit: 255
  end

  add_index "items", ["order_id"], name: "index_items_on_order_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "models", force: :cascade do |t|
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

  add_index "models", ["email"], name: "index_models_on_email", unique: true, using: :btree
  add_index "models", ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true, using: :btree

  create_table "notifications", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.string   "message",    limit: 255
    t.integer  "user_id",    limit: 4
    t.integer  "users_id",   limit: 4
    t.integer  "orders_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "notifications", ["order_id"], name: "fk_rails_fd5a31cf2f", using: :btree
  add_index "notifications", ["orders_id"], name: "index_notifications_on_orders_id", using: :btree
  add_index "notifications", ["user_id"], name: "fk_rails_b080fb4855", using: :btree
  add_index "notifications", ["users_id"], name: "index_notifications_on_users_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "order_for",           limit: 255
    t.string   "order_from",          limit: 255
    t.string   "menu_image",          limit: 255
    t.string   "status",              limit: 255
    t.integer  "user_id",             limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "orderusers", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "order_id",   limit: 4
    t.string   "status",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "person",     limit: 255
  end

  add_index "orderusers", ["order_id"], name: "index_orderusers_on_order_id", using: :btree
  add_index "orderusers", ["user_id"], name: "index_orderusers_on_user_id", using: :btree

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
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.string   "name",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "friends", "users"
<<<<<<< HEAD
  add_foreign_key "friends", "users", column: "friend", name: "friends_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "groups", "users"
  add_foreign_key "gusers", "groups"
  add_foreign_key "gusers", "users"
  add_foreign_key "items", "orders", on_update: :cascade, on_delete: :cascade
  add_foreign_key "items", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "notifications", "orders", on_update: :cascade, on_delete: :cascade
  add_foreign_key "notifications", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "orders", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "orderusers", "orders"
  add_foreign_key "orderusers", "users"
=======
  add_foreign_key "group_users", "groups"
  add_foreign_key "group_users", "users"
  add_foreign_key "groups", "users"
  add_foreign_key "items", "orders"
  add_foreign_key "items", "users"
  add_foreign_key "notifications", "orders"
  add_foreign_key "notifications", "users"
  add_foreign_key "order_users", "orders"
  add_foreign_key "order_users", "users"
  add_foreign_key "orders", "users"
>>>>>>> 4dc5c6129bc69a11940df65df2d68802a34ced7a
end
