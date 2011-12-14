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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111207231130) do

  create_table "addresses", :force => true do |t|
    t.integer  "user_id",       :null => false
    t.integer  "region_id",     :null => false
    t.string   "postcode",      :null => false
    t.string   "place",         :null => false
    t.string   "address",       :null => false
    t.string   "receiver_name", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["user_id"], :name => "index_addresses_on_user_id"

  create_table "authors", :force => true do |t|
    t.string "name"
  end

  add_index "authors", ["name"], :name => "index_authors_on_name", :unique => true

  create_table "authors_books", :id => false, :force => true do |t|
    t.integer "author_id", :null => false
    t.integer "book_id",   :null => false
  end

  add_index "authors_books", ["author_id"], :name => "index_authors_books_on_author_id"
  add_index "authors_books", ["book_id"], :name => "index_authors_books_on_book_id"

  create_table "books", :force => true do |t|
    t.string   "title",                                   :null => false
    t.text     "description"
    t.string   "isbn"
    t.integer  "year"
    t.integer  "pages_count"
    t.integer  "printed_copies_count"
    t.integer  "publisher_id"
    t.integer  "cover_type_id"
    t.integer  "weight"
    t.string   "image"
    t.decimal  "price",                                   :null => false
    t.integer  "quantity",             :default => 1,     :null => false
    t.boolean  "available",            :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "length"
    t.integer  "width"
    t.integer  "thickness"
  end

  add_index "books", ["isbn"], :name => "index_books_on_isbn", :unique => true

  create_table "books_categories", :id => false, :force => true do |t|
    t.integer "book_id",     :null => false
    t.integer "category_id", :null => false
  end

  add_index "books_categories", ["book_id"], :name => "index_books_categories_on_book_id"
  add_index "books_categories", ["category_id"], :name => "index_books_categories_on_category_id"

  create_table "cart_items", :force => true do |t|
    t.integer "cart_id",  :null => false
    t.integer "book_id",  :null => false
    t.integer "quantity", :null => false
  end

  add_index "cart_items", ["book_id"], :name => "index_cart_items_on_book_id"
  add_index "cart_items", ["cart_id"], :name => "index_cart_items_on_cart_id"

  create_table "carts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string "name"
  end

  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true

  create_table "cover_types", :force => true do |t|
    t.string "name"
  end

  add_index "cover_types", ["name"], :name => "index_cover_types_on_name", :unique => true

  create_table "order_items", :force => true do |t|
    t.integer "order_id"
    t.integer "book_id"
    t.integer "quantity"
    t.decimal "price"
  end

  add_index "order_items", ["order_id"], :name => "index_order_items_on_order_id"

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "region_id"
    t.string   "postcode"
    t.string   "place"
    t.string   "address"
    t.string   "receiver_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",         :limit => 6,                               :default => "unpaid", :null => false
    t.boolean  "reserved",                                                 :default => false,    :null => false
    t.decimal  "price",                      :precision => 8, :scale => 2
  end

  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "publishers", :force => true do |t|
    t.string "name"
  end

  add_index "publishers", ["name"], :name => "index_publishers_on_name", :unique => true

  create_table "regions", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "regions", ["name"], :name => "index_regions_on_name", :unique => true

  create_table "shipment_types", :force => true do |t|
    t.string "name"
  end

  add_index "shipment_types", ["name"], :name => "index_shipment_types_on_name", :unique => true

  create_table "shipments", :force => true do |t|
    t.integer  "order_id"
    t.string   "postal_identifier"
    t.integer  "shipment_type_id"
    t.datetime "created_at"
    t.string   "shipment_type"
  end

  add_index "shipments", ["order_id"], :name => "index_shipments_on_order_id"
  add_index "shipments", ["postal_identifier"], :name => "index_shipments_on_postal_identifier", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                                                               :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128,                               :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                                                               :default => false, :null => false
    t.decimal  "money",                                 :precision => 8, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "default_address_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
