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

ActiveRecord::Schema.define(:version => 20130321043521) do

  create_table "campaigns", :force => true do |t|
    t.integer  "client_id"
    t.integer  "url_id"
    t.integer  "keyphrase_id"
    t.string   "ttype"
    t.string   "ctype"
    t.date     "start"
    t.integer  "length",       :default => 30
    t.integer  "autoemails",   :default => 3
    t.text     "links"
    t.boolean  "complete"
    t.date     "links_index"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "campaigns", ["client_id"], :name => "index_campaigns_on_client_id"
  add_index "campaigns", ["keyphrase_id"], :name => "index_campaigns_on_keyphrase_id"
  add_index "campaigns", ["url_id"], :name => "index_campaigns_on_url_id"

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "company"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "phone3"
    t.string   "email"
    t.text     "address"
    t.string   "leadsource"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "keyphrases", :force => true do |t|
    t.string   "keyphrase"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "sale_lines", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "amount",      :precision => 10, :scale => 0
    t.integer  "quantity"
    t.boolean  "optional"
    t.integer  "position"
    t.integer  "sale_id"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "sale_lines", ["sale_id"], :name => "index_sale_lines_on_sale_id"

  create_table "sales", :force => true do |t|
    t.date     "quote"
    t.date     "invoice"
    t.integer  "client_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sales", ["client_id"], :name => "index_sales_on_client_id"

  create_table "t1links", :force => true do |t|
    t.integer  "keyphrase_id"
    t.text     "links"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "t1links", ["keyphrase_id"], :name => "index_t1links_on_keyphrase_id"

  create_table "transactions", :force => true do |t|
    t.date     "date"
    t.string   "description"
    t.decimal  "debit",       :precision => 10, :scale => 2
    t.decimal  "credit",      :precision => 10, :scale => 2
    t.decimal  "balance",     :precision => 10, :scale => 2
    t.string   "ttype"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "urls", :force => true do |t|
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
