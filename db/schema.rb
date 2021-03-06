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

ActiveRecord::Schema.define(version: 2022_03_07_141449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "availabilities", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.bigint "talent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["talent_id"], name: "index_availabilities_on_talent_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "status"
    t.string "message"
    t.datetime "date"
    t.bigint "talent_id", null: false
    t.bigint "place_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id"], name: "index_bookings_on_place_id"
    t.index ["talent_id"], name: "index_bookings_on_talent_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "place_genres", force: :cascade do |t|
    t.bigint "genre_id", null: false
    t.bigint "place_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id"], name: "index_place_genres_on_genre_id"
    t.index ["place_id"], name: "index_place_genres_on_place_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "title"
    t.string "address"
    t.string "website"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_places_on_email", unique: true
    t.index ["reset_password_token"], name: "index_places_on_reset_password_token", unique: true
  end

  create_table "promotions", force: :cascade do |t|
    t.string "message"
    t.bigint "place_id", null: false
    t.bigint "talent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id"], name: "index_promotions_on_place_id"
    t.index ["talent_id"], name: "index_promotions_on_talent_id"
  end

  create_table "talent_genres", force: :cascade do |t|
    t.bigint "genre_id", null: false
    t.bigint "talent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id"], name: "index_talent_genres_on_genre_id"
    t.index ["talent_id"], name: "index_talent_genres_on_talent_id"
  end

  create_table "talents", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "description"
    t.string "youtube_link"
    t.string "instagram_link"
    t.string "spotify_link"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_talents_on_email", unique: true
    t.index ["reset_password_token"], name: "index_talents_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "availabilities", "talents"
  add_foreign_key "bookings", "places"
  add_foreign_key "bookings", "talents"
  add_foreign_key "place_genres", "genres"
  add_foreign_key "place_genres", "places"
  add_foreign_key "promotions", "places"
  add_foreign_key "promotions", "talents"
  add_foreign_key "talent_genres", "genres"
  add_foreign_key "talent_genres", "talents"
end
