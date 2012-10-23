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

ActiveRecord::Schema.define(:version => 20121023164715) do

  create_table "games", :force => true do |t|
    t.integer  "platform_id"
    t.integer  "genre_id"
    t.string   "title"
    t.integer  "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "games", ["genre_id"], :name => "index_games_on_genre_id"
  add_index "games", ["platform_id", "genre_id"], :name => "index_games_on_platform_id_and_genre_id"
  add_index "games", ["platform_id"], :name => "index_games_on_platform_id"

  create_table "survey_responses", :force => true do |t|
    t.integer  "platform_id"
    t.integer  "genre_id"
    t.string   "person_name"
    t.integer  "min_price"
    t.integer  "max_price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "survey_responses", ["genre_id"], :name => "index_survey_responses_on_genre_id"
  add_index "survey_responses", ["platform_id"], :name => "index_survey_responses_on_platform_id"

end
