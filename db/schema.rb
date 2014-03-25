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

ActiveRecord::Schema.define(version: 20140324093724) do

  create_table "document_submissions", force: true do |t|
    t.integer  "template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content",     default: "", null: false
  end

  add_index "document_submissions", ["template_id"], name: "index_document_submissions_on_template_id"

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
  end

  add_index "template_fields", ["template_id"], name: "index_template_fields_on_template_id"

  create_table "templates", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
