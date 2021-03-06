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

ActiveRecord::Schema.define(version: 2015_10_21_170627) do

  create_table "document_submissions", force: :cascade do |t|
    t.integer "template_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.index ["template_id"], name: "index_document_submissions_on_template_id"
  end

  create_table "submitted_template_fields", force: :cascade do |t|
    t.integer "document_submission_id", null: false
    t.integer "template_field_id", null: false
    t.text "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_upload_file_name"
    t.string "file_upload_content_type"
    t.bigint "file_upload_file_size"
    t.datetime "file_upload_updated_at"
    t.index ["document_submission_id"], name: "index_submitted_template_fields_on_document_submission_id"
    t.index ["template_field_id"], name: "index_submitted_template_fields_on_template_field_id"
  end

  create_table "template_fields", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "default_value", null: false
    t.string "presentation", default: "text", null: false
    t.integer "template_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "available_options"
    t.integer "start_of_range"
    t.integer "end_of_range"
    t.string "label"
    t.boolean "required", default: false
    t.text "description"
    t.index ["template_id"], name: "index_template_fields_on_template_id"
  end

  create_table "template_packs", force: :cascade do |t|
    t.string "zip_container_file_name"
    t.string "zip_container_content_type"
    t.bigint "zip_container_file_size"
    t.datetime "zip_container_updated_at"
    t.integer "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "templates", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "template_pack_id"
    t.string "output_file_name"
    t.text "textual_description"
    t.index ["template_pack_id"], name: "index_templates_on_template_pack_id"
  end

end
