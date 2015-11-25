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

ActiveRecord::Schema.define(version: 20151125022613) do

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "carts", ["user_id"], name: "index_carts_on_user_id"

  create_table "items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "cart_id"
  end

  add_index "items", ["cart_id"], name: "index_items_on_cart_id"
  add_index "items", ["product_id"], name: "index_items_on_product_id"

  create_table "payments", force: :cascade do |t|
    t.integer  "type"
    t.string   "name"
    t.string   "card_number"
    t.date     "exp_date"
    t.integer  "cvv"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "user_id"
    t.integer  "cart_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "payments", ["cart_id"], name: "index_payments_on_cart_id"
  add_index "payments", ["user_id"], name: "index_payments_on_user_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",       precision: 5, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "photo"
  end

  create_table "shippings", force: :cascade do |t|
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "user_id"
    t.integer  "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shippings", ["cart_id"], name: "index_shippings_on_cart_id"
  add_index "shippings", ["user_id"], name: "index_shippings_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
