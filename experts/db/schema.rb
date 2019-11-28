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

ActiveRecord::Schema.define(:version => 20140418210010) do

  create_table "addresses", :force => true do |t|
    t.string   "line_1"
    t.string   "line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "addr_status"
    t.date     "active_date_from"
    t.date     "active_date_to"
    t.string   "county"
    t.integer  "person_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "case_roles", :force => true do |t|
    t.string   "role"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "case_roles_people", :id => false, :force => true do |t|
    t.integer "case_role_id"
    t.integer "person_id"
  end

  add_index "case_roles_people", ["case_role_id", "person_id"], :name => "index_case_roles_people_on_case_role_id_and_person_id"
  add_index "case_roles_people", ["person_id", "case_role_id"], :name => "index_case_roles_people_on_person_id_and_case_role_id"

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "contacts", :force => true do |t|
    t.string   "contact_string"
    t.string   "contact_type"
    t.text     "note"
    t.integer  "person_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "credentials", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "credentials_people", :id => false, :force => true do |t|
    t.integer "person_id"
    t.integer "credential_id"
  end

  add_index "credentials_people", ["credential_id", "person_id"], :name => "index_credentials_people_on_credential_id_and_person_id"
  add_index "credentials_people", ["person_id", "credential_id"], :name => "index_credentials_people_on_person_id_and_credential_id"

  create_table "documents", :force => true do |t|
    t.string   "title"
    t.string   "document_type"
    t.string   "description"
    t.date     "date_of_file"
    t.integer  "person_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "expert_file"
    t.string   "case"
    t.string   "confidential_item"
    t.string   "county"
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_initial"
    t.string   "suffix"
    t.date     "date_of_birth"
    t.date     "date_of_death"
    t.string   "nickname"
    t.string   "tax_id"
    t.string   "license"
    t.text     "hidden_note"
    t.string   "spanish_speaking"
    t.string   "status"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "people_specialties", :id => false, :force => true do |t|
    t.integer "person_id"
    t.integer "specialty_id"
  end

  add_index "people_specialties", ["person_id", "specialty_id"], :name => "index_people_specialties_on_person_id_and_specialty_id"
  add_index "people_specialties", ["specialty_id", "person_id"], :name => "index_people_specialties_on_specialty_id_and_person_id"

  create_table "specialties", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
