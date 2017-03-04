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

ActiveRecord::Schema.define(version: 20170304155725) do

  create_table "rides", force: :cascade do |t|
    t.date     "ride_date"
    t.string   "departure_location"
    t.string   "arrival_location"
    t.float    "seat_price"
    t.float    "payments"
    t.integer  "total_seats"
    t.integer  "available_seats"
    t.integer  "reserved_seats"
    t.text     "notes"
    t.float    "total_ride_amount"
    t.boolean  "completed"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "ride_id"
  end

  add_index "rides", ["ride_id"], name: "index_rides_on_ride_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "phone_number"
    t.integer  "ratings"
    t.integer  "average_rating"
    t.boolean  "verified"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
