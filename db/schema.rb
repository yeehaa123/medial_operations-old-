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

ActiveRecord::Schema.define(:version => 20120927131252) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "articles", ["slug"], :name => "index_articles_on_slug", :unique => true

  create_table "authors", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "authorships", :force => true do |t|
    t.integer  "reference_id"
    t.integer  "author_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "authorships", ["author_id", "reference_id"], :name => "index_authorships_on_author_id_and_reference_id", :unique => true
  add_index "authorships", ["author_id"], :name => "index_authorships_on_author_id"
  add_index "authorships", ["reference_id"], :name => "index_authorships_on_reference_id"

  create_table "cited_works", :force => true do |t|
    t.integer  "reference_id"
    t.integer  "article_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "cited_works", ["article_id"], :name => "index_cited_works_on_article_id"
  add_index "cited_works", ["reference_id", "article_id"], :name => "index_cited_works_on_reference_id_and_article_id", :unique => true
  add_index "cited_works", ["reference_id"], :name => "index_cited_works_on_reference_id"

  create_table "coauthorships", :force => true do |t|
    t.integer  "author_id"
    t.integer  "reference_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "coauthorships", ["author_id", "reference_id"], :name => "index_coauthorships_on_author_id_and_reference_id", :unique => true
  add_index "coauthorships", ["author_id"], :name => "index_coauthorships_on_author_id"
  add_index "coauthorships", ["reference_id"], :name => "index_coauthorships_on_reference_id"

  create_table "courses", :force => true do |t|
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "title"
    t.text     "description"
    t.string   "slug"
    t.string   "title_prefix"
  end

  add_index "courses", ["slug"], :name => "index_courses_on_slug", :unique => true

  create_table "publisheds", :force => true do |t|
    t.integer  "publisher_id"
    t.integer  "reference_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "publisheds", ["publisher_id", "reference_id"], :name => "index_publisheds_on_publisher_id_and_reference_id", :unique => true
  add_index "publisheds", ["publisher_id"], :name => "index_publisheds_on_publisher_id"
  add_index "publisheds", ["reference_id"], :name => "index_publisheds_on_reference_id"

  create_table "publishers", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "readings", :force => true do |t|
    t.integer  "reference_id"
    t.integer  "session_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "readings", ["reference_id", "session_id"], :name => "index_readings_on_reference_id_and_session_id", :unique => true
  add_index "readings", ["reference_id"], :name => "index_readings_on_reference_id"
  add_index "readings", ["session_id"], :name => "index_readings_on_session_id"

  create_table "references", :force => true do |t|
    t.string   "title"
    t.date     "date"
    t.string   "medium"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "type"
    t.integer  "type_id"
    t.boolean  "collection", :default => false
  end

  add_index "references", ["collection"], :name => "index_references_on_collection"
  add_index "references", ["type_id"], :name => "index_references_on_type_id"

  create_table "sections", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "course_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "number"
    t.string   "slug"
  end

  add_index "sections", ["course_id"], :name => "index_sections_on_course_id"
  add_index "sections", ["slug"], :name => "index_sections_on_slug"

  create_table "sessions", :force => true do |t|
    t.string   "title"
    t.integer  "number"
    t.text     "description"
    t.integer  "course_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "section_id"
    t.string   "location"
    t.datetime "start_time"
    t.datetime "end_time"
  end

end
