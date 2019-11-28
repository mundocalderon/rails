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

ActiveRecord::Schema.define(:version => 20130517000506) do

  create_table "books", :force => true do |t|
    t.string   "title"
    t.string   "publication_type"
    t.string   "date_of_publication"
    t.string   "published_by"
    t.string   "edition"
    t.integer  "number_of_copies"
    t.string   "volume"
    t.string   "location"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "citation"
  end

  create_table "books_contributors", :id => false, :force => true do |t|
    t.integer "book_id"
    t.integer "contributor_id"
  end

  add_index "books_contributors", ["book_id", "contributor_id"], :name => "index_books_contributors_on_book_id_and_contributor_id"
  add_index "books_contributors", ["contributor_id", "book_id"], :name => "index_books_contributors_on_contributor_id_and_book_id"

  create_table "books_editors", :id => false, :force => true do |t|
    t.integer "book_id"
    t.integer "editor_id"
  end

  add_index "books_editors", ["book_id", "editor_id"], :name => "index_books_editors_on_book_id_and_editor_id"
  add_index "books_editors", ["editor_id", "book_id"], :name => "index_books_editors_on_editor_id_and_book_id"

  create_table "contributors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "editors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "search_suggestions", :force => true do |t|
    t.string   "term"
    t.integer  "popularity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transactions", :force => true do |t|
    t.date     "date_of_issue"
    t.date     "date_of_return"
    t.integer  "book_id"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
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
