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

ActiveRecord::Schema.define(version: 20151204024801) do

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "workflow_state"
    t.integer  "payment_id"
    t.integer  "shipping_id"
  end

  add_index "carts", ["payment_id"], name: "index_carts_on_payment_id"
  add_index "carts", ["shipping_id"], name: "index_carts_on_shipping_id"
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

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.string   "payment_address"
    t.string   "shipping_address"
    t.string   "credit_card_info"
    t.integer  "cart_id"
    t.decimal  "amount"
    t.string   "workflow_state"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "orders", ["cart_id"], name: "index_orders_on_cart_id"

  create_table "payments", force: :cascade do |t|
    t.integer  "card_type"
    t.string   "name"
    t.string   "card_number"
    t.date     "exp_date"
    t.integer  "cvv"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "payments", ["user_id"], name: "index_payments_on_user_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",       precision: 5, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "photo"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id"
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
