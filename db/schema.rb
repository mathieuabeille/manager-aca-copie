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

ActiveRecord::Schema.define(version: 2021_01_23_171801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "archive_descriptions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "archive_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "archives", force: :cascade do |t|
    t.string "archiveType"
    t.integer "client_id"
    t.string "code"
    t.string "location"
    t.string "sensible"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.integer "year"
    t.string "clients", default: [], array: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "leader"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "site"
    t.boolean "actif"
    t.string "forminc"
    t.string "siret"
    t.string "cnaf"
    t.string "sexe"
    t.integer "lastinvoice"
  end

  create_table "contratcdds", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.string "poste"
    t.integer "remuneration"
    t.integer "heure"
    t.boolean "trial"
    t.boolean "video"
    t.bigint "employee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_contratcdds_on_employee_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.string "document"
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "folder_id", null: false
    t.integer "position"
    t.integer "user_id"
    t.index ["folder_id"], name: "index_documents_on_folder_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "sexe"
    t.string "lastname"
    t.string "firstname"
    t.string "address"
    t.string "birthplace"
    t.string "birthdate"
    t.string "secu"
    t.string "permitnumber"
    t.date "permitend"
    t.date "permitstart"
    t.string "permitlocaction"
    t.bigint "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "birth"
    t.index ["client_id"], name: "index_employees_on_client_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "name"
    t.string "expense"
    t.string "status"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "amount"
    t.integer "tva"
    t.string "category"
    t.string "paymenttype"
    t.text "comment"
    t.string "doc1"
    t.string "doc2"
    t.string "doc3"
    t.string "doc4"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "filters", force: :cascade do |t|
    t.string "company"
    t.string "materialtype"
    t.string "supplier"
    t.string "brand"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "folders", force: :cascade do |t|
    t.string "name"
    t.integer "order"
    t.boolean "managerAccess"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "position"
    t.string "background"
    t.integer "user_id"
  end

  create_table "invoicelines", force: :cascade do |t|
    t.string "name"
    t.string "price"
    t.string "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "invoice_id"
    t.bigint "label_id"
    t.integer "vat"
    t.integer "tva"
    t.string "latva"
    t.index ["invoice_id"], name: "index_invoicelines_on_invoice_id"
    t.index ["label_id"], name: "index_invoicelines_on_label_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "author"
    t.string "status"
    t.string "invoicetype"
    t.string "name"
    t.integer "vat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "client_id"
    t.string "email"
    t.string "bill"
    t.decimal "amount", precision: 8, scale: 2
    t.integer "user_id"
    t.string "destinary"
    t.string "days"
    t.index ["client_id"], name: "index_invoices_on_client_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.string "labeltype"
    t.text "description"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "material_comments", force: :cascade do |t|
    t.string "author"
    t.text "comment"
    t.bigint "material_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["material_id"], name: "index_material_comments_on_material_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "company"
    t.string "materialtype"
    t.string "supplier"
    t.string "name"
    t.string "serial"
    t.string "number"
    t.string "location"
    t.string "invoice"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "brand"
    t.string "status"
    t.text "description"
    t.decimal "price", precision: 8, scale: 2
    t.string "garantuee"
    t.string "amortization"
    t.date "buyingdate"
    t.string "licence"
    t.decimal "interest", precision: 8, scale: 2
    t.decimal "acompte", precision: 8, scale: 2
    t.integer "periode"
    t.integer "user_id"
    t.string "accountingcode"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.boolean "superadmin_role"
    t.boolean "supervisor_role"
    t.boolean "user_role"
    t.integer "client_id"
    t.integer "clients", default: [], array: true
    t.string "days"
    t.string "siret"
    t.string "entreprise"
    t.string "address"
    t.string "bank"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "documents", "folders"
  add_foreign_key "material_comments", "materials"
end
