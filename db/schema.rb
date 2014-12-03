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

ActiveRecord::Schema.define(version: 20141124142315) do

  create_table "document_submissions", force: true do |t|
    t.integer  "template_id",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content",     default: "", null: false
  end

  add_index "document_submissions", ["template_id"], name: "index_document_submissions_on_template_id"

  create_table "submitted_template_fields", force: true do |t|
    t.integer  "document_submission_id",              null: false
    t.integer  "template_field_id",                   null: false
    t.string   "value",                  default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "submitted_template_fields", ["document_submission_id"], name: "index_submitted_template_fields_on_document_submission_id"
  add_index "submitted_template_fields", ["template_field_id"], name: "index_submitted_template_fields_on_template_field_id"

  create_table "template_fields", force: true do |t|
    t.string   "name",              default: "",     null: false
    t.string   "default_value",     default: "",     null: false
    t.string   "presentation",      default: "text", null: false
    t.integer  "template_id",                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "available_options", default: ""
    t.integer  "start_of_range"
    t.integer  "end_of_range"
    t.string   "label"
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
    t.string   "name",                default: "", null: false
    t.text     "content",             default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "template_asset_path"
    t.integer  "template_pack_id"
    t.string   "output_file_name"
  end

end
