# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_05_182738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deal_stages", force: :cascade do |t|
    t.integer "percent"
    t.string "name"
  end

  create_table "deals", force: :cascade do |t|
    t.bigint "deal_stage_id", null: false
    t.string "name"
    t.decimal "value"
    t.index ["deal_stage_id"], name: "index_deals_on_deal_stage_id"
  end

  add_foreign_key "deals", "deal_stages"
end
