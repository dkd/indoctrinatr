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

ActiveRecord::Schema.define(version: 20141008091149) do

  create_table "document_submissions", force: true do |t|
    t.integer  "template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content",                  default: "", null: false
    t.string   "document_submission_name"
    t.integer  "user_id"
  end

  add_index "document_submissions", ["template_id"], name: "index_document_submissions_on_template_id"
  add_index "document_submissions", ["user_id"], name: "index_document_submissions_on_user_id"

  create_table "documents", force: true do |t|
    t.integer  "document_submission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "documents", ["document_submission_id"], name: "index_documents_on_document_submission_id"

  create_table "submitted_template_fields", force: true do |t|
    t.integer  "document_submission_id"
    t.integer  "template_field_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "submitted_template_fields", ["document_submission_id"], name: "index_submitted_template_fields_on_document_submission_id"
  add_index "submitted_template_fields", ["template_field_id"], name: "index_submitted_template_fields_on_template_field_id"

  create_table "template_fields", force: true do |t|
    t.string   "name"
    t.string   "default_value"
    t.string   "presentation"
    t.integer  "template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "available_options", default: ""
    t.integer  "start_of_range"
    t.integer  "end_of_range"
  end

  add_index "template_fields", ["template_id"], name: "index_template_fields_on_template_id"

  create_table "template_packs", force: true do |t|
    t.string   "zip_container_file_name"
    t.string   "zip_container_content_type"
    t.integer  "zip_container_file_size"
    t.datetime "zip_container_updated_at"
    t.integer  "template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "templates", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "template_pack"
    t.string   "template_asset_path"
    t.integer  "template_pack_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",           null: false
    t.string   "encrypted_password",     default: "",           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   default: "basic_user", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
