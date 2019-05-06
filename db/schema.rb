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

ActiveRecord::Schema.define(version: 2019_04_20_045745) do

  create_table "attendances", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "in_time"
    t.datetime "out_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address", default: "不明", null: false
    t.float "longitude", default: 0.0, null: false
    t.float "latitude", default: 0.0, null: false
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "costs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "earning_id"
    t.integer "travel_cost", default: 0, null: false
    t.integer "accommodation", default: 0, null: false
    t.integer "buying_price", default: 0, null: false
    t.integer "for_tasting", default: 0, null: false
    t.integer "fixtures", default: 0, null: false
    t.integer "others", default: 0, null: false
    t.string "others_content", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["earning_id"], name: "index_costs_on_earning_id"
    t.index ["user_id"], name: "index_costs_on_user_id"
  end

  create_table "earnings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.date "date"
    t.integer "revenue", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "daily_cost", default: 0, null: false
    t.integer "target", default: 0, null: false
    t.bigint "monthly_id"
    t.string "expenses_image"
    t.string "ordering_image"
    t.string "others_image"
    t.index ["monthly_id"], name: "index_earnings_on_monthly_id"
    t.index ["user_id"], name: "index_earnings_on_user_id"
  end

  create_table "monthlies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "year", default: 0, null: false
    t.integer "month", default: 0, null: false
    t.integer "sum_target", default: 0, null: false
    t.integer "target_monthly", default: 0, null: false
    t.integer "sum_cost", default: 0, null: false
    t.integer "sum_earning", default: 0, null: false
    t.integer "attendance_days", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_monthlies_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.boolean "is_admin", default: false, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "salary", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attendances", "users"
  add_foreign_key "costs", "earnings"
  add_foreign_key "costs", "users"
  add_foreign_key "earnings", "monthlies"
  add_foreign_key "earnings", "users"
  add_foreign_key "monthlies", "users"
end
