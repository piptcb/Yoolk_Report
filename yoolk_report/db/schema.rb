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

ActiveRecord::Schema.define(version: 0) do

  create_table "listings.", id: false, force: true do |t|
    t.string   "portal_uuid",         limit: 72,  default: "", null: false
    t.string   "uuid",                limit: 72,  default: "", null: false
    t.integer  "is_active",                       default: 0,  null: false
    t.string   "alias_id",            limit: 100
    t.string   "name",                limit: 200
    t.string   "address",             limit: 510
    t.string   "postal_code",         limit: 100
    t.string   "description",         limit: 256
    t.string   "long_description",    limit: 256
    t.string   "location_uuid",       limit: 72
    t.string   "lat",                 limit: 200
    t.string   "long",                limit: 200
    t.integer  "zoom_level",                      default: 16
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "business_type_uuid",  limit: 72,               null: false
    t.integer  "has_exclusive_asset"
    t.integer  "fap",                             default: 0
    t.integer  "version",                         default: 0
    t.string   "note",                limit: 256
    t.string   "country_uuid",        limit: 72
    t.integer  "v2_view_count",                   default: 0
    t.integer  "view_count",                      default: 0
    t.integer  "is_locked",                       default: 0
    t.integer  "is_client",                       default: 0
    t.integer  "show_map_on_web",                 default: 1
    t.string   "source_uuid",         limit: 72
    t.string   "headline",            limit: 510
    t.string   "qrcode_filename",     limit: 510
    t.string   "created_by",          limit: 72
    t.string   "verify_status",       limit: 60
    t.string   "reject_reason",       limit: 510
    t.string   "source_type",         limit: 200
    t.string   "source_name",         limit: 510
    t.string   "archived_reason",     limit: 510
  end

  create_table "schema_migrations.", id: false, force: true do |t|
    t.string "version", null: false
  end

end
