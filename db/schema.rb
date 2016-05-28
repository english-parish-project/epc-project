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

ActiveRecord::Schema.define(version: 20160528175637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alters", force: :cascade do |t|
    t.boolean  "medieval_alter"
    t.string   "date"
    t.boolean  "date_secured"
    t.text     "date_evidence"
    t.text     "location_in_chancel"
    t.integer  "fabric_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "alters", ["fabric_id"], name: "index_alters_on_fabric_id", using: :btree

  create_table "chancels", force: :cascade do |t|
    t.string   "date"
    t.boolean  "date_secured"
    t.text     "date_evidence"
    t.string   "styles",                   default: [],              array: true
    t.text     "chancel_arch_description"
    t.integer  "fabric_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "chancels", ["fabric_id"], name: "index_chancels_on_fabric_id", using: :btree

  create_table "chantry_chapels", force: :cascade do |t|
    t.string   "date"
    t.boolean  "date_secured"
    t.text     "date_evidence"
    t.text     "location"
    t.string   "funding_information"
    t.string   "styles",              default: [],              array: true
    t.text     "general_notes"
    t.integer  "fabric_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "chantry_chapels", ["fabric_id"], name: "index_chantry_chapels_on_fabric_id", using: :btree

  create_table "churches", force: :cascade do |t|
    t.string   "name"
    t.string   "town"
    t.string   "county"
    t.string   "buildings_of_england_volume"
    t.string   "diocese"
    t.string   "archdeaconry"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "minster_status"
    t.boolean  "minster_current_status"
    t.boolean  "collegiate_status"
    t.integer  "collegiate_date"
    t.integer  "first_mentioned_in_text"
    t.text     "first_mentioned_in_text_explanation"
    t.string   "earliest_extant_fabric_date"
    t.text     "earliest_extant_fabric_date_evidence"
    t.boolean  "earliest_extant_fabric_date_secured"
    t.text     "earliest_extant_fabric_location"
    t.text     "general_comments"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "doors", force: :cascade do |t|
    t.text     "location"
    t.boolean  "original"
    t.text     "notes"
    t.integer  "fabric_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "doors", ["fabric_id"], name: "index_doors_on_fabric_id", using: :btree

  create_table "fabrics", force: :cascade do |t|
    t.string   "styles",     default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "church_id"
  end

  add_index "fabrics", ["church_id"], name: "index_fabrics_on_church_id", using: :btree

  create_table "fonts", force: :cascade do |t|
    t.text     "location"
    t.string   "date"
    t.boolean  "date_secured"
    t.text     "date_evidence"
    t.text     "notes"
    t.integer  "fabric_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "fonts", ["fabric_id"], name: "index_fonts_on_fabric_id", using: :btree

  create_table "lady_chapels", force: :cascade do |t|
    t.string   "date"
    t.boolean  "date_secured"
    t.text     "date_evidence"
    t.string   "location"
    t.string   "styles",        default: [],              array: true
    t.text     "general_notes"
    t.integer  "fabric_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "lady_chapels", ["fabric_id"], name: "index_lady_chapels_on_fabric_id", using: :btree

  create_table "naves", force: :cascade do |t|
    t.string   "date"
    t.boolean  "date_secured"
    t.text     "date_evidence"
    t.string   "styles",        default: [],              array: true
    t.text     "notes"
    t.integer  "fabric_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "naves", ["fabric_id"], name: "index_naves_on_fabric_id", using: :btree

  create_table "piscinas", force: :cascade do |t|
    t.text     "location"
    t.string   "date"
    t.boolean  "date_secured"
    t.text     "date_evidence"
    t.text     "notes"
    t.integer  "fabric_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "piscinas", ["fabric_id"], name: "index_piscinas_on_fabric_id", using: :btree

  create_table "porches", force: :cascade do |t|
    t.text     "location"
    t.string   "date"
    t.boolean  "date_secured"
    t.text     "date_evidence"
    t.boolean  "valuting"
    t.text     "valuting_type"
    t.text     "notes"
    t.integer  "fabric_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "porches", ["fabric_id"], name: "index_porches_on_fabric_id", using: :btree

  create_table "screens", force: :cascade do |t|
    t.string   "date"
    t.boolean  "date_secured"
    t.text     "date_evidence"
    t.text     "description"
    t.integer  "fabric_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "screens", ["fabric_id"], name: "index_screens_on_fabric_id", using: :btree

  create_table "sedilia", force: :cascade do |t|
    t.string   "date"
    t.boolean  "date_secured"
    t.text     "date_evidence"
    t.string   "styles",        default: [],              array: true
    t.integer  "fabric_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "sedilia", ["fabric_id"], name: "index_sedilia_on_fabric_id", using: :btree

  create_table "styles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "towers", force: :cascade do |t|
    t.string   "location"
    t.string   "date"
    t.boolean  "date_secured"
    t.text     "date_evidence"
    t.text     "notes"
    t.integer  "fabric_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "towers", ["fabric_id"], name: "index_towers_on_fabric_id", using: :btree

  create_table "transepts", force: :cascade do |t|
    t.boolean  "south_side"
    t.string   "south_side_date"
    t.boolean  "south_side_date_secured"
    t.string   "south_side_date_evidence"
    t.boolean  "south_side_aisled"
    t.string   "south_side_notes"
    t.boolean  "north_side"
    t.string   "north_side_date"
    t.boolean  "north_side_date_secured"
    t.boolean  "north_side_aisled"
    t.string   "north_side_notes"
    t.integer  "fabric_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "transepts", ["fabric_id"], name: "index_transepts_on_fabric_id", using: :btree

end
