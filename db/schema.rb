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

ActiveRecord::Schema.define(version: 20151111182132) do

  create_table "categories", force: true do |t|
    t.string   "department"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "company_name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["category_id"], name: "index_companies_on_category_id"

  create_table "conversations", force: true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discounts", force: true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "discount_percent"
    t.string   "restrictions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "discounts", ["category_id"], name: "index_discounts_on_category_id"
  add_index "discounts", ["company_id"], name: "index_discounts_on_company_id"
  add_index "discounts", ["user_id"], name: "index_discounts_on_user_id"

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.boolean  "read",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
