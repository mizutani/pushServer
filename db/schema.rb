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

ActiveRecord::Schema.define(:version => 20130331124226) do

  create_table "admins", :force => true do |t|
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
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "app_users", :force => true do |t|
    t.string   "name"
    t.integer  "app_id"
    t.string   "app_name"
    t.string   "email"
    t.string   "password"
    t.string   "auth_key"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "docs", :force => true do |t|
    t.string   "name"
    t.string   "tag"
    t.string   "url"
    t.text     "parameter"
    t.text     "description"
    t.text     "message"
    t.text     "response"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "gcm_app_users", :force => true do |t|
    t.string   "app_user_id"
    t.string   "app_id"
    t.string   "auth_key"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "rapns_apps", :force => true do |t|
    t.string   "name",                       :null => false
    t.string   "environment"
    t.text     "certificate"
    t.string   "password"
    t.integer  "connections", :default => 1, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "type",                       :null => false
    t.string   "auth_key"
    t.integer  "user_id"
  end

  create_table "rapns_feedback", :force => true do |t|
    t.string   "device_token", :limit => 64, :null => false
    t.datetime "failed_at",                  :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "app"
  end

  add_index "rapns_feedback", ["device_token"], :name => "index_rapns_feedback_on_device_token"

  create_table "rapns_notifications", :force => true do |t|
    t.integer  "badge"
    t.string   "device_token",      :limit => 64
    t.string   "sound",                            :default => "default"
    t.string   "alert"
    t.text     "data"
    t.integer  "expiry",                           :default => 86400
    t.boolean  "delivered",                        :default => false,     :null => false
    t.datetime "delivered_at"
    t.boolean  "failed",                           :default => false,     :null => false
    t.datetime "failed_at"
    t.integer  "error_code"
    t.text     "error_description", :limit => 255
    t.datetime "deliver_after"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.boolean  "alert_is_json",                    :default => false
    t.string   "type",                                                    :null => false
    t.string   "collapse_key"
    t.boolean  "delay_while_idle",                 :default => false,     :null => false
    t.text     "registration_ids"
    t.integer  "app_id",                                                  :null => false
    t.integer  "retries",                          :default => 0
  end

  add_index "rapns_notifications", ["app_id", "delivered", "failed", "deliver_after"], :name => "index_rapns_notifications_multi"

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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
