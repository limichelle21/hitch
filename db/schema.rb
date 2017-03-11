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

ActiveRecord::Schema.define(version: 20170310221137) do

  create_table "carpools", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ride_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "rider_number"
    t.float    "total_payment"
  end

  add_index "carpools", ["id"], name: "index_carpools_on_id", unique: true
  add_index "carpools", ["ride_id"], name: "index_carpools_on_ride_id"
  add_index "carpools", ["user_id"], name: "index_carpools_on_user_id"

  create_table "disbursements", force: :cascade do |t|
    t.integer  "stripe_disbursement_id"
    t.integer  "user_id"
    t.datetime "disbursed_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "disbursements", ["user_id"], name: "index_disbursements_on_user_id"

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.datetime "sent_at"
    t.integer  "carpool_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "messages", ["carpool_id"], name: "index_messages_on_carpool_id"

  create_table "payments", force: :cascade do |t|
    t.integer  "carpool_id"
    t.integer  "user_id"
    t.datetime "paid_at"
    t.integer  "stripe_id"
    t.integer  "disbursement_id"
    t.float    "payment_amount"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "payments", ["carpool_id"], name: "index_payments_on_carpool_id"
  add_index "payments", ["user_id"], name: "index_payments_on_user_id"

  create_table "ratings", force: :cascade do |t|
    t.integer  "rating_value"
    t.text     "rating_comment"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "rides", force: :cascade do |t|
    t.date     "ride_date"
    t.string   "departure_location"
    t.string   "arrival_location"
    t.float    "seat_price"
    t.integer  "total_seats"
    t.integer  "available_seats"
    t.integer  "reserved_seats"
    t.text     "notes"
    t.float    "total_ride_amount"
    t.boolean  "completed"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.boolean  "booked"
  end

  add_index "rides", ["user_id"], name: "index_rides_on_user_id"

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
    t.integer  "average_rating"
    t.boolean  "verified"
    t.string   "payment_card_token"
    t.string   "bank_account_token"
    t.string   "card_type"
    t.string   "last_4"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
