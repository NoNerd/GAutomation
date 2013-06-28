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

ActiveRecord::Schema.define(:version => 20130626035350) do

  create_table "hosts", :force => true do |t|
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "http_automations", :force => true do |t|
    t.string   "hre_type"
    t.string   "description"
    t.string   "base_id",     :limit => 11
    t.string   "expect",      :limit => 1023
    t.integer  "host_id"
    t.integer  "env"
    t.string   "url_path"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "http_results", :force => true do |t|
    t.integer  "http_automation_id"
    t.string   "actual",             :limit => 1024
    t.string   "result",             :limit => 4
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "remote_machines", :force => true do |t|
    t.string   "ipaddress"
    t.string   "smokescriptpath"
    t.string   "funcscriptpath"
    t.integer  "comstatus",       :default => 4
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "step_results", :force => true do |t|
    t.integer  "teststep_id"
    t.string   "actual",          :limit => 1023
    t.integer  "result"
    t.string   "ipaddress"
    t.string   "screenshot_path"
    t.integer  "counter"
    t.integer  "task_id"
    t.integer  "testcase_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "description"
    t.integer  "run_counter", :default => 0
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "tcandtasks", :force => true do |t|
    t.integer  "task_id"
    t.integer  "testcase_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "testcase_results", :force => true do |t|
    t.integer  "testcase_id"
    t.integer  "result"
    t.integer  "counter"
    t.integer  "status",      :default => 0
    t.string   "ipaddress"
    t.integer  "task_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "testcases", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "browser"
    t.integer  "run",         :default => 0
    t.integer  "capture",     :default => 0
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "teststeps", :force => true do |t|
    t.integer  "testcase_id"
    t.integer  "step"
    t.string   "description"
    t.string   "step_method", :default => "action"
    t.string   "obj_name"
    t.string   "call_method"
    t.string   "input"
    t.string   "expect"
    t.integer  "run",         :default => 0
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "tobjects", :force => true do |t|
    t.string   "syn_name"
    t.string   "label_types"
    t.string   "label_attributes"
    t.string   "attribute_values"
    t.string   "description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "url_performances", :force => true do |t|
    t.integer  "runflag"
    t.string   "url"
    t.string   "browser"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "url_results", :force => true do |t|
    t.string   "url"
    t.integer  "response_time"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",   :null => false
    t.string   "password",   :null => false
    t.integer  "position",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "wiki_page_versions", :force => true do |t|
    t.integer  "page_id",    :null => false
    t.integer  "updator_id"
    t.integer  "number"
    t.string   "comment"
    t.string   "path"
    t.string   "title"
    t.text     "content"
    t.datetime "updated_at"
  end

  add_index "wiki_page_versions", ["page_id"], :name => "index_wiki_page_versions_on_page_id"
  add_index "wiki_page_versions", ["updator_id"], :name => "index_wiki_page_versions_on_updator_id"

  create_table "wiki_pages", :force => true do |t|
    t.integer  "creator_id"
    t.integer  "updator_id"
    t.string   "path"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "wiki_pages", ["creator_id"], :name => "index_wiki_pages_on_creator_id"
  add_index "wiki_pages", ["path"], :name => "index_wiki_pages_on_path", :unique => true

end
