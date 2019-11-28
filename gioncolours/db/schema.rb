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

ActiveRecord::Schema.define(version: 20140905024906) do

  create_table "announcement_types", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "announcement_types_announcements", force: true do |t|
    t.integer  "announcement_type_id"
    t.integer  "announcement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "announcements", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.date     "post_date"
    t.string   "attachment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_image_galleries", force: true do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: true do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gig_types", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gig_types_gigs", force: true do |t|
    t.integer  "gig_type_id"
    t.integer  "gig_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gigs", force: true do |t|
    t.date     "date"
    t.string   "venue"
    t.string   "location"
    t.text     "details"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tour_id"
  end

  create_table "tours", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "date_begin"
    t.string   "date_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "video_types", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "video_types_videos", force: true do |t|
    t.integer  "video_type_id"
    t.integer  "video_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "video_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
