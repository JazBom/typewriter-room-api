# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_01_021240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inspirations", force: :cascade do |t|
    t.string "sentence"
    t.string "sentenceOf"
    t.string "imageUrl"
    t.string "imageOf"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "text_item_id"
    t.integer "rater_id"
    t.float "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rater_id"], name: "index_ratings_on_rater_id"
    t.index ["text_item_id"], name: "index_ratings_on_text_item_id"
  end

  create_table "text_items", force: :cascade do |t|
    t.string "text"
    t.boolean "published"
    t.integer "writer_id"
    t.integer "inspiration_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.index ["inspiration_id"], name: "index_text_items_on_inspiration_id"
    t.index ["writer_id"], name: "index_text_items_on_writer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
