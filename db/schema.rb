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

ActiveRecord::Schema[7.0].define(version: 2022_09_08_085323) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Reqeuest", force: :cascade do |t|
    t.integer "status", null: false
  end

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
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "conversations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.date "dateDebut"
    t.date "dateFin"
    t.string "ecole"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_educations_on_user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "dateDebut"
    t.string "dateFin"
    t.string "jobType"
    t.string "description"
    t.string "entreprise"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "favoris", force: :cascade do |t|
    t.bigint "mission_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id", "user_id"], name: "index_favoris_on_mission_id_and_user_id", unique: true
    t.index ["mission_id"], name: "index_favoris_on_mission_id"
    t.index ["user_id"], name: "index_favoris_on_user_id"
  end

  create_table "freelancer_languages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "language_id", null: false
    t.integer "languagerate", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id", "user_id"], name: "index_freelancer_languages_on_language_id_and_user_id", unique: true
    t.index ["language_id"], name: "index_freelancer_languages_on_language_id"
    t.index ["user_id"], name: "index_freelancer_languages_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mission_languages", force: :cascade do |t|
    t.bigint "mission_id", null: false
    t.bigint "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_mission_languages_on_language_id"
    t.index ["mission_id"], name: "index_mission_languages_on_mission_id"
  end

  create_table "missions", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "duration"
    t.date "beginingDate"
    t.boolean "completed"
    t.string "contrat"
    t.string "postulated"
    t.string "filepath"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "budget"
    t.integer "client_id"
    t.integer "freelancer_id"
    t.integer "requests_count", default: 0
    t.integer "reviews_count", default: 0
    t.index ["category_id"], name: "index_missions_on_category_id"
    t.index ["client_id"], name: "index_missions_on_client_id"
    t.index ["freelancer_id"], name: "index_missions_on_freelancer_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mission_id"
    t.integer "freelancer_id"
    t.index ["freelancer_id"], name: "index_requests_on_freelancer_id"
    t.index ["mission_id", "freelancer_id"], name: "index_requests_on_mission_id_and_freelancer_id", unique: true
    t.index ["mission_id"], name: "index_requests_on_mission_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "mission_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id", "user_id"], name: "index_reviews_on_mission_id_and_user_id", unique: true
    t.index ["mission_id"], name: "index_reviews_on_mission_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.boolean "is_private", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "lastname", null: false
    t.string "firstname", null: false
    t.string "email", null: false
    t.string "adresse"
    t.date "birthday"
    t.string "password_digest"
    t.string "sexe"
    t.float "rating"
    t.integer "phone"
    t.string "job"
    t.string "description"
    t.string "photo"
    t.integer "earning"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.boolean "email_confirmed"
    t.string "confirm_token"
    t.string "github"
    t.string "facebook"
    t.string "instagram"
    t.string "linkedin"
    t.integer "reviews_count", default: 0
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.integer "RIB"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "educations", "users"
  add_foreign_key "experiences", "users"
  add_foreign_key "favoris", "missions"
  add_foreign_key "favoris", "users"
  add_foreign_key "freelancer_languages", "languages"
  add_foreign_key "freelancer_languages", "users"
  add_foreign_key "mission_languages", "languages"
  add_foreign_key "mission_languages", "missions"
  add_foreign_key "missions", "categories"
  add_foreign_key "reviews", "missions"
  add_foreign_key "reviews", "users"
end
