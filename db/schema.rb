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

ActiveRecord::Schema.define(version: 2020_09_02_194347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "affiliates", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_no"
    t.string "fax"
    t.string "company"
    t.string "add1"
    t.string "add2"
    t.string "city"
    t.string "postal_code"
    t.string "state"
    t.string "country"
    t.string "tracking_code"
    t.boolean "status", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer "quantity"
    t.float "sub_total"
    t.bigint "products_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["products_id"], name: "index_carts_on_products_id"
  end

  create_table "configurators", force: :cascade do |t|
    t.string "name"
    t.integer "configurator_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_configurators_on_user_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "coupon_type"
    t.integer "discount"
    t.integer "total_amount"
    t.boolean "customer_login"
    t.boolean "free_shipping"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "uses"
    t.integer "uses_per_customer"
    t.boolean "status", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.text "image"
    t.boolean "status", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "phone_no"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.string "company"
    t.string "address"
    t.string "phone_no"
    t.boolean "status", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "product_id"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "order_vouchers", force: :cascade do |t|
    t.string "sender_name"
    t.string "sender_email"
    t.string "receiver_name"
    t.string "receiver_email"
    t.string "message"
    t.float "amount"
    t.bigint "gift_theme_id"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gift_theme_id"], name: "index_order_vouchers_on_gift_theme_id"
    t.index ["order_id"], name: "index_order_vouchers_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_no"
    t.string "fax"
    t.boolean "guest"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true, null: false
    t.float "total_amount", default: 0.0, null: false
    t.integer "invoice_no"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "payment_details", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company"
    t.string "add1"
    t.string "add2"
    t.string "city"
    t.string "postal_code"
    t.string "state"
    t.string "country"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payment_details_on_order_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.integer "sort_order"
    t.boolean "status", default: true, null: false
    t.bigint "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "main_category_id"
    t.string "title_tag"
    t.text "meta_tag_description"
    t.string "meta_tag_keywords"
    t.string "seo_keywords"
    t.boolean "top", default: false, null: false
    t.integer "columns"
    t.index ["main_category_id"], name: "index_product_categories_on_main_category_id"
    t.index ["type_id"], name: "index_product_categories_on_type_id"
    t.index ["user_id"], name: "index_product_categories_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "model"
    t.string "sku"
    t.integer "upc"
    t.integer "ean"
    t.float "price"
    t.integer "quantity"
    t.integer "min_quantity"
    t.boolean "out_stock_status"
    t.boolean "requires_shipment"
    t.string "image"
    t.float "length"
    t.float "height"
    t.float "width"
    t.float "weight"
    t.boolean "status", default: true, null: false
    t.integer "sort_order"
    t.text "selected_products"
    t.boolean "featured", default: false, null: false
    t.bigint "tax_class_id"
    t.bigint "weight_class_id"
    t.bigint "length_class_id"
    t.bigint "product_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.text "detailed_description"
    t.bigint "manufacturer_id"
    t.string "jan"
    t.string "isbn"
    t.string "mpn"
    t.string "location"
    t.boolean "subtract_stock", default: false, null: false
    t.string "seo_keywords"
    t.string "title_tag"
    t.string "meta_tag_description"
    t.string "meta_tag_keywords"
    t.index ["length_class_id"], name: "index_products_on_length_class_id"
    t.index ["manufacturer_id"], name: "index_products_on_manufacturer_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["tax_class_id"], name: "index_products_on_tax_class_id"
    t.index ["user_id"], name: "index_products_on_user_id"
    t.index ["weight_class_id"], name: "index_products_on_weight_class_id"
  end

  create_table "related_products", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "related_product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_related_products_on_product_id"
  end

  create_table "shipment_details", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company"
    t.string "add1"
    t.string "add2"
    t.string "city"
    t.string "postal_code"
    t.string "state"
    t.string "country"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_shipment_details_on_order_id"
  end

  create_table "tacos", force: :cascade do |t|
    t.integer "meat", default: 0, null: false
    t.boolean "rice", default: false
    t.boolean "salsa", default: false
    t.boolean "guacamole", default: false
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "image"
    t.boolean "status", default: true, null: false
    t.boolean "supper_admin", default: false, null: false
    t.bigint "role_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "wish_lists", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_wish_lists_on_customer_id"
    t.index ["product_id"], name: "index_wish_lists_on_product_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "carts", "products", column: "products_id"
  add_foreign_key "configurators", "users"
  add_foreign_key "product_categories", "users"
  add_foreign_key "products", "users"
  add_foreign_key "wish_lists", "customers"
  add_foreign_key "wish_lists", "products"
end
