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

ActiveRecord::Schema.define(version: 2021_12_14_033902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", primary_key: "company_code", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "mail"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "prefecture_id"
    t.index ["prefecture_id"], name: "index_companies_on_prefecture_id"
  end

  create_table "company_branches", force: :cascade do |t|
    t.bigint "prefecture_id"
    t.string "company_id"
    t.index ["company_id"], name: "index_company_branches_on_company_id"
    t.index ["prefecture_id"], name: "index_company_branches_on_prefecture_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", unique: true
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.string "vendor_id"
    t.string "manufacturer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manufacturer_id"], name: "index_items_on_manufacturer_id"
    t.index ["vendor_id"], name: "index_items_on_vendor_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_havings", force: :cascade do |t|
    t.bigint "having_id"
    t.bigint "user_id"
    t.index ["having_id"], name: "index_user_havings_on_having_id"
    t.index ["user_id"], name: "index_user_havings_on_user_id"
  end

  create_table "user_wishlists", force: :cascade do |t|
    t.bigint "wishlist_id"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_user_wishlists_on_user_id"
    t.index ["wishlist_id"], name: "index_user_wishlists_on_wishlist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "companies", "prefectures"
  add_foreign_key "company_branches", "companies", primary_key: "company_code"
  add_foreign_key "company_branches", "prefectures"
  add_foreign_key "friendships", "users"
  add_foreign_key "friendships", "users", column: "friend_id"
  add_foreign_key "items", "companies", column: "manufacturer_id", primary_key: "company_code"
  add_foreign_key "items", "companies", column: "vendor_id", primary_key: "company_code"
  add_foreign_key "user_havings", "items", column: "having_id"
  add_foreign_key "user_havings", "users"
  add_foreign_key "user_wishlists", "items", column: "wishlist_id"
  add_foreign_key "user_wishlists", "users"
end
