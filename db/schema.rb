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

ActiveRecord::Schema.define(version: 20151021170627) do

  create_table "document_submissions", force: :cascade do |t|
    t.integer  "template_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
  end

  add_index "document_submissions", ["template_id"], name: "index_document_submissions_on_template_id"

  create_table "submitted_template_fields", force: :cascade do |t|
    t.integer  "document_submission_id",   null: false
    t.integer  "template_field_id",        null: false
    t.text     "value",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_upload_file_name"
    t.string   "file_upload_content_type"
    t.integer  "file_upload_file_size"
    t.datetime "file_upload_updated_at"
  end

  add_index "submitted_template_fields", ["document_submission_id"], name: "index_submitted_template_fields_on_document_submission_id"
  add_index "submitted_template_fields", ["template_field_id"], name: "index_submitted_template_fields_on_template_field_id"

  create_table "template_fields", force: :cascade do |t|
    t.string   "name",              limit: 255, default: "",     null: false
    t.text     "default_value",                                  null: false
    t.string   "presentation",      limit: 255, default: "text", null: false
    t.integer  "template_id",                                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "available_options"
    t.integer  "start_of_range"
    t.integer  "end_of_range"
    t.string   "label",             limit: 255
    t.boolean  "required",                      default: false
    t.text     "description"
  end

  add_index "template_fields", ["template_id"], name: "index_template_fields_on_template_id"

  create_table "template_packs", force: :cascade do |t|
    t.string   "zip_container_file_name",    limit: 255
    t.string   "zip_container_content_type", limit: 255
    t.integer  "zip_container_file_size"
    t.datetime "zip_container_updated_at"
    t.integer  "template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "templates", force: :cascade do |t|
    t.string   "name",                limit: 255, default: "", null: false
    t.text     "content",                                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "template_pack_id"
    t.string   "output_file_name",    limit: 255
    t.text     "textual_description"
  end

  add_index "templates", ["template_pack_id"], name: "index_templates_on_template_pack_id"

end
