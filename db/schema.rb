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

ActiveRecord::Schema.define(:version => 20110710213820) do

  create_table "campaign_members", :force => true do |t|
    t.integer "campaign_id",  :null => false
    t.integer "user_id",      :null => false
    t.integer "character_id"
    t.integer "role",         :null => false
  end

  add_index "campaign_members", ["campaign_id"], :name => "index_campaign_members_on_campaign_id"
  add_index "campaign_members", ["character_id"], :name => "index_campaign_members_on_character_id"
  add_index "campaign_members", ["user_id"], :name => "index_campaign_members_on_user_id"

  create_table "campaigns", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description"
    t.text     "summary"
    t.integer  "user_id",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campaigns", ["user_id"], :name => "index_campaigns_on_user_id"

  create_table "character_classes", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "role"
    t.string   "alignment"
    t.integer  "hit_die"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "character_classes", ["name"], :name => "index_character_classes_on_name", :unique => true

  create_table "class_levels", :force => true do |t|
    t.integer  "character_id"
    t.integer  "class_id"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "class_levels", ["character_id", "class_id"], :name => "index_class_levels_on_character_id_and_class_id", :unique => true

  create_table "creature_bases", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.integer  "race_id"
    t.integer  "str"
    t.integer  "dex"
    t.integer  "con"
    t.integer  "int"
    t.integer  "wis"
    t.integer  "cha"
    t.integer  "max_hp"
    t.integer  "current_hp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.integer "instance_id"
    t.string  "class_name"
    t.string  "gender"
    t.boolean "is_primary"
    t.string  "image_url"
    t.string  "thumb_url"
  end

  add_index "images", ["class_name"], :name => "index_images_on_class_name"
  add_index "images", ["gender"], :name => "index_images_on_gender"
  add_index "images", ["instance_id"], :name => "index_images_on_instance_id"
  add_index "images", ["is_primary"], :name => "index_images_on_is_primary"

  create_table "races", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "physical_description"
    t.text     "society"
    t.text     "relations"
    t.text     "philosophy"
    t.text     "adventurers"
    t.text     "names"
    t.text     "male_names"
    t.text     "female_names"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "races", ["name"], :name => "index_races_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "perishable_token"
    t.string   "roles"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "show_tutorial",     :default => true, :null => false
    t.string   "display_name"
  end

end
