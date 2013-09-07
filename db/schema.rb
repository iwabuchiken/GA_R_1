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

ActiveRecord::Schema.define(:version => 20130905050910) do

  create_table "admins", :force => true do |t|
    t.integer  "current_generation"
    t.integer  "num_of_gene_elements"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "genes_per_generation"
    t.string   "value_set"
    t.string   "optimal_percentage"
  end

  create_table "genes", :force => true do |t|
    t.integer  "suited"
    t.text     "gene"
    t.integer  "generation"
    t.integer  "in_generation_serial"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

end
