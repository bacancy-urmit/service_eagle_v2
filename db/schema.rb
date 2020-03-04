# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_03_134917) do

  create_table "appoinment_bookings", force: :cascade do |t|
    t.string "vehicle_name"
    t.string "service"
    t.datetime "service_date"
    t.datetime "pickup_date"
    t.string "special_request"
    t.string "employee_name"
    t.datetime "drop_time"
    t.datetime "pickup_time"
    t.string "service_status", default: "pending"
    t.integer "user_id", null: false
    t.integer "service_center_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "vehicle_type"
    t.index ["service_center_id"], name: "index_appoinment_bookings_on_service_center_id"
    t.index ["user_id"], name: "index_appoinment_bookings_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "email"
    t.integer "company_admin_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "service_center_id"
    t.index ["company_admin_id"], name: "index_companies_on_company_admin_id"
    t.index ["service_center_id"], name: "index_companies_on_service_center_id"
  end

  create_table "company_admins", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_admins_on_company_id"
    t.index ["user_id"], name: "index_company_admins_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "service_center_capacities", force: :cascade do |t|
    t.integer "count"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "service_centers", force: :cascade do |t|
    t.string "name"
    t.string "area"
    t.string "city"
    t.string "state"
    t.string "pincode"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spareparts", force: :cascade do |t|
    t.string "vehicle_name"
    t.string "sparepart_name"
    t.float "price"
    t.integer "quantity"
    t.datetime "manufactured_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_servicecenters", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "service_center_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_center_id"], name: "index_user_servicecenters_on_service_center_id"
    t.index ["user_id"], name: "index_user_servicecenters_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "firstname"
    t.string "lastname"
    t.string "username"
    t.string "contact"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "appoinment_bookings", "service_centers"
  add_foreign_key "appoinment_bookings", "users"
  add_foreign_key "companies", "service_centers"
  add_foreign_key "company_admins", "companies"
  add_foreign_key "company_admins", "users"
  add_foreign_key "user_servicecenters", "service_centers"
  add_foreign_key "user_servicecenters", "users"
end
