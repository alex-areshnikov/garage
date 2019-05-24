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

ActiveRecord::Schema.define(version: 2019_05_23_024439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "owner_type"
    t.bigint "owner_id"
    t.string "file"
    t.string "document_type"
    t.string "certificate_number"
    t.string "issued_by"
    t.date "issued_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_documents_on_owner_type_and_owner_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.bigint "site_id"
    t.date "birthdate"
    t.string "address"
    t.string "passport_number"
    t.string "passport_issued_by"
    t.date "passport_issue_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.index ["site_id"], name: "index_people_on_site_id"
  end

  create_table "people_sites", force: :cascade do |t|
    t.bigint "site_id"
    t.bigint "person_id"
    t.string "relationship"
    t.index ["person_id"], name: "index_people_sites_on_person_id"
    t.index ["site_id"], name: "index_people_sites_on_site_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string "number"
    t.text "description"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_phones_on_person_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.decimal "area", precision: 5, scale: 1
    t.text "notes"
    t.boolean "built"
    t.boolean "registered"
    t.boolean "basement"
    t.integer "cars_count"
    t.boolean "electricity"
    t.string "electricity_counter_name"
    t.date "electricity_counter_expiration_date"
    t.boolean "rented"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string "foreign_key_name", null: false
    t.integer "foreign_key_id"
    t.index ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key"
    t.index ["version_id"], name: "index_version_associations_on_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.integer "transaction_id"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["transaction_id"], name: "index_versions_on_transaction_id"
  end

  add_foreign_key "people", "sites"
  add_foreign_key "people_sites", "people"
  add_foreign_key "people_sites", "sites"
  add_foreign_key "phones", "people"
end
