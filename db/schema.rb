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

ActiveRecord::Schema.define(version: 20150727225713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.string   "first_name",               null: false
    t.string   "last_name",                null: false
    t.string   "email",                    null: false
    t.integer  "phone_number",   limit: 8, null: false
    t.integer  "doctor_uid",     limit: 8, null: false
    t.string   "gender"
    t.string   "specialization"
    t.string   "institution"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "doctors", ["doctor_uid"], name: "index_doctors_on_doctor_uid", using: :btree
  add_index "doctors", ["email"], name: "index_doctors_on_email", using: :btree
  add_index "doctors", ["first_name"], name: "index_doctors_on_first_name", using: :btree
  add_index "doctors", ["institution"], name: "index_doctors_on_institution", using: :btree
  add_index "doctors", ["last_name"], name: "index_doctors_on_last_name", using: :btree
  add_index "doctors", ["specialization"], name: "index_doctors_on_specialization", using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "first_name",                  null: false
    t.string   "last_name",                   null: false
    t.string   "email",                       null: false
    t.integer  "phone_number",      limit: 8, null: false
    t.text     "healthcard_number",           null: false
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "patients", ["email"], name: "index_patients_on_email", using: :btree
  add_index "patients", ["first_name"], name: "index_patients_on_first_name", using: :btree
  add_index "patients", ["healthcard_number"], name: "index_patients_on_healthcard_number", using: :btree
  add_index "patients", ["last_name"], name: "index_patients_on_last_name", using: :btree

end
