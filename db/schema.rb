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

ActiveRecord::Schema.define(version: 20151122191933) do

  create_table "paths", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "shop_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "paths", ["shop_id"], name: "index_paths_on_shop_id", using: :btree

  create_table "sub_paths", force: :cascade do |t|
    t.string   "part",       limit: 255
    t.integer  "path_id",    limit: 4
    t.boolean  "terminator"
    t.integer  "id_ref",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sub_paths", ["path_id", "id_ref", "terminator"], name: "index_sub_paths_on_path_id_and_id_ref_and_terminator", using: :btree

  create_table "offers", force: :cascade do |t|
    t.integer  "price_cent", limit: 4
    t.text     "desc",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "name",       limit: 255
  end

  add_index "offers", ["name"], name: "index_offers_on_name", unique: true, using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "growth_habit", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "url",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "paths", "shops"
end
