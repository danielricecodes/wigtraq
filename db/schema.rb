# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090916152400) do

  create_table "availabilities", :force => true do |t|
    t.integer  "employee_id"
    t.datetime "event_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "event_type"
    t.integer  "event_duration"
  end

  add_index "availabilities", ["employee_id"], :name => "index_availabilities_on_employee_id"
  add_index "availabilities", ["event_duration", "employee_id", "event_type", "event_date"], :name => "availability_uniqueness_contraint", :unique => true

  create_table "bucks", :force => true do |t|
    t.date     "award_date"
    t.text     "reason"
    t.integer  "amount",      :default => 1
    t.integer  "manager_id"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bucks", ["employee_id", "manager_id"], :name => "index_bucks_on_employee_id_and_manager_id"

  create_table "employees", :force => true do |t|
    t.string   "name",                     :limit => 40
    t.string   "region",                   :limit => 10
    t.integer  "manager_id"
    t.boolean  "active_bool"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "angel_name"
    t.boolean  "included_in_training",                   :default => true, :null => false
    t.boolean  "included_in_availability",               :default => true, :null => false
  end

  add_index "employees", ["manager_id"], :name => "index_employees_on_manager_id"

  create_table "logged_exceptions", :force => true do |t|
    t.string   "exception_class"
    t.string   "controller_name"
    t.string   "action_name"
    t.text     "message"
    t.text     "backtrace"
    t.text     "environment"
    t.text     "request"
    t.datetime "created_at"
  end

  create_table "managers", :force => true do |t|
    t.string   "name",        :limit => 40
    t.string   "region",      :limit => 10
    t.boolean  "active_bool",               :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id",                       :null => false
    t.text     "data",       :limit => 2147483647
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "time_offs", :force => true do |t|
    t.integer  "employee_id"
    t.date     "day"
    t.decimal  "hours",       :precision => 5, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "reason"
  end

  add_index "time_offs", ["employee_id"], :name => "index_time_offs_on_employee_id"

  create_table "trainings", :force => true do |t|
    t.string   "employee",      :limit => 40
    t.date     "trainingDate"
    t.integer  "employee_id"
    t.decimal  "hours_trained",               :precision => 5, :scale => 2, :default => 0.0
    t.integer  "position"
    t.string   "brand"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trainings", ["employee_id"], :name => "index_trainings_on_employee_id"

end
