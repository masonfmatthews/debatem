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

ActiveRecord::Schema.define(version: 20151123015351) do

  create_table "claims", force: :cascade do |t|
    t.integer  "proposition_id"
    t.text     "claim"
    t.string   "data_url"
    t.text     "warrant"
    t.integer  "user_id"
    t.boolean  "positive"
    t.integer  "parent_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "claims", ["parent_id"], name: "index_claims_on_parent_id"
  add_index "claims", ["proposition_id"], name: "index_claims_on_proposition_id"
  add_index "claims", ["user_id"], name: "index_claims_on_user_id"

  create_table "propositions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "propositions", ["created_at"], name: "index_propositions_on_created_at"
  add_index "propositions", ["user_id"], name: "index_propositions_on_user_id"

  create_table "thumbs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "claim_id"
    t.boolean  "up"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "thumbs", ["claim_id"], name: "index_thumbs_on_claim_id"
  add_index "thumbs", ["user_id"], name: "index_thumbs_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
