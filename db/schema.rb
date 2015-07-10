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

ActiveRecord::Schema.define(version: 20150704220219) do

  create_table "account_bans", force: true do |t|
    t.string   "login"
    t.string   "channel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts", force: true do |t|
    t.string   "login"
    t.string   "pass"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "active_keys", force: true do |t|
    t.string   "apikey"
    t.string   "login"
    t.datetime "last_updated"
    t.string   "heroid"
    t.datetime "last_controlled"
    t.string   "rolled_heroid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clan_relations", force: true do |t|
    t.string   "rel_type"
    t.string   "rel_name"
    t.text     "hostile"
    t.text     "friendly"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "class_specs", force: true do |t|
    t.string   "class_name"
    t.integer  "str"
    t.integer  "dex"
    t.integer  "mag"
    t.integer  "int"
    t.integer  "tra"
    t.integer  "vel"
    t.integer  "hp"
    t.integer  "mana"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "creature_x_spells", force: true do |t|
    t.string   "spell_class"
    t.string   "spell_name"
    t.string   "creature_type"
    t.string   "creature_name"
    t.string   "mod"
    t.string   "prefix_name"
    t.string   "suffix_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "creatures", force: true do |t|
    t.string   "creature_name"
    t.string   "mod"
    t.string   "creature_type"
    t.integer  "str"
    t.integer  "dex"
    t.integer  "mag"
    t.integer  "int"
    t.integer  "tra"
    t.integer  "vel"
    t.integer  "hp"
    t.integer  "mana"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "factions", force: true do |t|
    t.string   "faction_name"
    t.string   "lib_imp"
    t.string   "lib_rop"
    t.string   "lib_dap"
    t.string   "lib_vip"
    t.string   "lib_tvp"
    t.string   "lib_prp"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "h_descriptors", force: true do |t|
    t.string   "hid"
    t.string   "hero_name"
    t.integer  "mood"
    t.integer  "lvl"
    t.text     "map"
    t.integer  "pack_max_size"
    t.integer  "experience"
    t.integer  "exp_to_next_lvl"
    t.integer  "x_pos"
    t.integer  "y_pos"
    t.string   "hclass"
    t.string   "hrace"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hero_stats", force: true do |t|
    t.string   "heroid"
    t.integer  "str"
    t.integer  "dex"
    t.integer  "mag"
    t.integer  "int"
    t.integer  "tra"
    t.integer  "vel"
    t.integer  "max_hp"
    t.integer  "max_mana"
    t.integer  "current_hp"
    t.integer  "current_mana"
    t.integer  "start_str"
    t.integer  "start_dex"
    t.integer  "start_mag"
    t.integer  "start_int"
    t.integer  "start_tra"
    t.integer  "start_vel"
    t.integer  "start_hp"
    t.integer  "start_mana"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventars", force: true do |t|
    t.string   "heroid"
    t.string   "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invites", force: true do |t|
    t.string   "data"
    t.string   "sender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_descs", force: true do |t|
    t.string   "item_id"
    t.string   "item_name"
    t.text     "look"
    t.string   "owner_hero_id"
    t.string   "slot"
    t.integer  "value"
    t.integer  "worth"
    t.integer  "weight"
    t.text     "history"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_owners", force: true do |t|
    t.string   "item_id"
    t.string   "heroid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "libs", force: true do |t|
    t.string   "token"
    t.string   "item"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parties", force: true do |t|
    t.string   "name"
    t.string   "pass"
    t.string   "owner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "party_members", force: true do |t|
    t.string   "party"
    t.string   "member"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "party_statuses", force: true do |t|
    t.string   "party"
    t.string   "server"
    t.string   "channel"
    t.integer  "cd"
    t.string   "method"
    t.integer  "before_attack"
    t.integer  "word_count_min"
    t.integer  "word_count_max"
    t.string   "list_name"
    t.integer  "max_emotes"
    t.string   "caps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "party_updates", force: true do |t|
    t.string   "party"
    t.string   "rec"
    t.datetime "date"
    t.string   "update_type"
    t.string   "nick"
    t.text     "message_text"
    t.string   "user_status"
    t.string   "server"
    t.string   "channel"
    t.integer  "cd"
    t.string   "method"
    t.integer  "before_attack"
    t.integer  "word_count_min"
    t.integer  "word_count_max"
    t.string   "list_name"
    t.integer  "max_emotes"
    t.string   "caps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "person_name"
    t.string   "lib_imp"
    t.string   "lib_rop"
    t.string   "lib_dap"
    t.string   "lib_vip"
    t.string   "lib_tvp"
    t.string   "lib_prp"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slot_items", force: true do |t|
    t.string   "heroid"
    t.string   "item_id"
    t.string   "slot"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spam_accounts", force: true do |t|
    t.string   "login"
    t.string   "pass"
    t.string   "owner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spam_items", force: true do |t|
    t.string   "list_name"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spam_lists", force: true do |t|
    t.string   "owner"
    t.string   "listname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spells", force: true do |t|
    t.string   "spell_name"
    t.string   "spell_class"
    t.text     "spell_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_x_heros", force: true do |t|
    t.string   "login"
    t.string   "heroid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "password"
    t.string   "realname"
    t.string   "group"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
