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

ActiveRecord::Schema.define(version: 20141013233641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.integer  "location_id"
    t.string   "zip_code"
    t.string   "street"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["street"], name: "index_addresses_on_street", using: :btree
  add_index "addresses", ["zip_code"], name: "index_addresses_on_zip_code", using: :btree

  create_table "articles", force: true do |t|
    t.string   "type"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "title"
    t.text     "content"
    t.string   "icon"
    t.boolean  "published"
    t.integer  "position",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["resource_type"], name: "index_articles_on_resource_type", using: :btree
  add_index "articles", ["type"], name: "index_articles_on_type", using: :btree

  create_table "categories", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "permalink"
    t.string   "icon"
    t.boolean  "published",   default: false
    t.integer  "ideas_count", default: 0
    t.integer  "position",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["permalink"], name: "index_categories_on_permalink", using: :btree
  add_index "categories", ["title"], name: "index_categories_on_title", using: :btree

  create_table "categories_ideas", force: true do |t|
    t.integer  "category_id"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_projects", force: true do |t|
    t.integer  "category_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crop_data", force: true do |t|
    t.integer  "picture_id"
    t.integer  "crop_x"
    t.integer  "crop_y"
    t.integer  "crop_w"
    t.integer  "crop_h"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emails", force: true do |t|
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emails", ["address"], name: "index_emails_on_address", using: :btree

  create_table "features", force: true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.text     "description"
    t.string   "icon"
    t.integer  "position",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "permalink"
    t.string   "icon"
    t.boolean  "published",   default: false
    t.integer  "ideas_count", default: 0
    t.integer  "position",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["permalink"], name: "index_groups_on_permalink", using: :btree
  add_index "groups", ["title"], name: "index_groups_on_title", using: :btree

  create_table "groups_ideas", force: true do |t|
    t.integer  "group_id"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_projects", force: true do |t|
    t.integer  "group_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "html_docs", force: true do |t|
    t.string   "resource_type"
    t.integer  "resource_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "html_docs", ["resource_type"], name: "index_html_docs_on_resource_type", using: :btree

  create_table "ideas", force: true do |t|
    t.integer  "person_id"
    t.string   "title"
    t.text     "details"
    t.integer  "number",          default: 0
    t.string   "token"
    t.boolean  "approved",        default: false
    t.integer  "commiters_count", default: 0
    t.integer  "comments_count",  default: 0
    t.integer  "votes_up",        default: 0
    t.integer  "votes_down",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ideas", ["title"], name: "index_ideas_on_title", using: :btree
  add_index "ideas", ["token"], name: "index_ideas_on_token", using: :btree

  create_table "locations", force: true do |t|
    t.string   "country_code"
    t.string   "subdivision"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["city"], name: "index_locations_on_city", using: :btree
  add_index "locations", ["country_code"], name: "index_locations_on_country_code", using: :btree
  add_index "locations", ["subdivision"], name: "index_locations_on_subdivision", using: :btree

  create_table "messages", force: true do |t|
    t.integer  "person_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.string   "country_code"
    t.string   "city"
    t.integer  "ideas_count",  default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "people", ["city"], name: "index_people_on_city", using: :btree
  add_index "people", ["country_code"], name: "index_people_on_country_code", using: :btree
  add_index "people", ["first_name"], name: "index_people_on_first_name", using: :btree
  add_index "people", ["last_name"], name: "index_people_on_last_name", using: :btree

  create_table "phones", force: true do |t|
    t.string   "country_code"
    t.string   "number"
    t.boolean  "fax",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phones", ["country_code"], name: "index_phones_on_country_code", using: :btree
  add_index "phones", ["number"], name: "index_phones_on_number", using: :btree

  create_table "picas", force: true do |t|
    t.string   "type"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.integer  "picture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "picas", ["resource_type"], name: "index_picas_on_resource_type", using: :btree
  add_index "picas", ["type"], name: "index_picas_on_type", using: :btree

  create_table "projects", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "permalink"
    t.date     "date_started"
    t.boolean  "published",       default: false
    t.integer  "ideas_count",     default: 0
    t.integer  "commiters_count", default: 0
    t.integer  "comments_count",  default: 0
    t.integer  "position",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["permalink"], name: "index_projects_on_permalink", using: :btree
  add_index "projects", ["title"], name: "index_projects_on_title", using: :btree

  create_table "projects_ideas", force: true do |t|
    t.integer  "project_id"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quotes", force: true do |t|
    t.string   "who"
    t.text     "said"
    t.string   "when"
    t.string   "where"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resource_addresses", force: true do |t|
    t.string   "resource_type"
    t.integer  "resource_id"
    t.integer  "address_id"
    t.integer  "position",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resource_addresses", ["resource_type"], name: "index_resource_addresses_on_resource_type", using: :btree

  create_table "resource_emails", force: true do |t|
    t.string   "resource_type"
    t.integer  "resource_id"
    t.integer  "email_id"
    t.integer  "position",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resource_emails", ["resource_type"], name: "index_resource_emails_on_resource_type", using: :btree

  create_table "resource_phones", force: true do |t|
    t.string   "resource_type"
    t.integer  "resource_id"
    t.integer  "phone_id"
    t.integer  "position",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resource_phones", ["resource_type"], name: "index_resource_phones_on_resource_type", using: :btree

  create_table "resource_websites", force: true do |t|
    t.string   "resource_type"
    t.integer  "resource_id"
    t.integer  "website_id"
    t.integer  "position",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resource_websites", ["resource_type"], name: "index_resource_websites_on_resource_type", using: :btree

  create_table "taggings", force: true do |t|
    t.string   "resource_type"
    t.integer  "resource_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["resource_type"], name: "index_taggings_on_resource_type", using: :btree

  create_table "tags", force: true do |t|
    t.string   "value"
    t.integer  "taggings_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["value"], name: "index_tags_on_value", using: :btree

  create_table "uploads", force: true do |t|
    t.string   "type"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "origin"
    t.text     "description"
    t.integer  "used_count",       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "src_file_name"
    t.string   "src_content_type"
    t.integer  "src_file_size"
    t.datetime "src_updated_at"
  end

  add_index "uploads", ["resource_type"], name: "index_uploads_on_resource_type", using: :btree
  add_index "uploads", ["type"], name: "index_uploads_on_type", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "role"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "websites", force: true do |t|
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "websites", ["address"], name: "index_websites_on_address", using: :btree

end
