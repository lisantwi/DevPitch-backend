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

ActiveRecord::Schema.define(version: 2019_10_01_172455) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.string "src"
    t.bigint "project_id"
    t.index ["project_id"], name: "index_images_on_project_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_languages", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_project_languages_on_language_id"
    t.index ["project_id"], name: "index_project_languages_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_complete", default: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "priority"
    t.date "due_date"
    t.bigint "project_id"
    t.boolean "is_complete", default: false
    t.index ["project_id"], name: "index_tasks_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "images", "projects"
  add_foreign_key "project_languages", "languages"
  add_foreign_key "project_languages", "projects"
  add_foreign_key "projects", "users"
  add_foreign_key "tasks", "projects"
end
