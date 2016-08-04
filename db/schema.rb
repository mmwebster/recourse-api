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

ActiveRecord::Schema.define(version: 20160804210807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "subject"
    t.string   "number"
    t.string   "title"
    t.decimal  "units"
    t.boolean  "season_fall"
    t.boolean  "season_winter"
    t.boolean  "season_spring"
    t.decimal  "total_units"
    t.integer  "node_id"
    t.integer  "course_id"
    t.integer  "quarter_id"
    t.integer  "timeline_id"
    t.integer  "school_id"
    t.index ["course_id"], name: "index_courses_on_course_id", using: :btree
    t.index ["node_id"], name: "index_courses_on_node_id", using: :btree
    t.index ["quarter_id"], name: "index_courses_on_quarter_id", using: :btree
    t.index ["school_id"], name: "index_courses_on_school_id", using: :btree
    t.index ["timeline_id"], name: "index_courses_on_timeline_id", using: :btree
  end

  create_table "courses_quarters", id: false, force: :cascade do |t|
    t.integer "course_id",  null: false
    t.integer "quarter_id", null: false
    t.index ["course_id"], name: "index_courses_quarters_on_course_id", using: :btree
    t.index ["quarter_id"], name: "index_courses_quarters_on_quarter_id", using: :btree
  end

  create_table "courses_timelines", id: false, force: :cascade do |t|
    t.integer "course_id",   null: false
    t.integer "timeline_id", null: false
    t.index ["course_id"], name: "index_courses_timelines_on_course_id", using: :btree
    t.index ["timeline_id"], name: "index_courses_timelines_on_timeline_id", using: :btree
  end

  create_table "nodes", force: :cascade do |t|
    t.string   "title"
    t.string   "node_type"
    t.integer  "children_required"
    t.string   "node_goal_type"
    t.string   "node_course_parent_rel"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "school_id"
    t.integer  "course_id"
    t.index ["course_id"], name: "index_nodes_on_course_id", using: :btree
    t.index ["school_id"], name: "index_nodes_on_school_id", using: :btree
  end

  create_table "quarters", force: :cascade do |t|
    t.string   "season"
    t.decimal  "max_units"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "timeline_id"
    t.date     "start_date"
    t.index ["timeline_id"], name: "index_quarters_on_timeline_id", using: :btree
  end

  create_table "schools", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timelines", force: :cascade do |t|
    t.string   "starting_season"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "title"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_timelines_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name_first"
    t.string   "name_last"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "school_id"
    t.index ["school_id"], name: "index_users_on_school_id", using: :btree
  end

  add_foreign_key "courses", "courses"
  add_foreign_key "courses", "nodes"
  add_foreign_key "courses", "quarters"
  add_foreign_key "courses", "schools"
  add_foreign_key "courses", "timelines"
  add_foreign_key "nodes", "courses"
  add_foreign_key "nodes", "schools"
  add_foreign_key "quarters", "timelines"
  add_foreign_key "timelines", "users"
  add_foreign_key "users", "schools"
end
