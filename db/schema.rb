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

ActiveRecord::Schema.define(version: 20160606093537) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "blogelator_authors", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "user_type"
    t.text     "bio_html"
    t.text     "bio_markdown"
    t.string   "cover_photo_file_name"
    t.string   "cover_photo_content_type"
    t.integer  "cover_photo_file_size"
    t.datetime "cover_photo_updated_at"
    t.string   "location"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.string   "name"
    t.string   "profile_photo_file_name"
    t.string   "profile_photo_content_type"
    t.integer  "profile_photo_file_size"
    t.datetime "profile_photo_updated_at"
    t.string   "slug"
    t.string   "website"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "blogelator_authors", ["slug"], name: "index_blogelator_authors_on_slug"
  add_index "blogelator_authors", ["user_type", "user_id"], name: "index_blogelator_authors_on_user_type_and_user_id"

  create_table "blogelator_posts", force: :cascade do |t|
    t.integer  "author_id"
    t.text     "body_html"
    t.text     "body_markdown"
    t.boolean  "featured"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.datetime "published_at"
    t.string   "slug"
    t.integer  "status",             default: 0
    t.text     "summary_html"
    t.text     "summary_markdown"
    t.string   "title"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "blogelator_posts", ["author_id"], name: "index_blogelator_posts_on_author_id"
  add_index "blogelator_posts", ["slug"], name: "index_blogelator_posts_on_slug"

  create_table "blogelator_posts_posts", force: :cascade do |t|
    t.integer "post_id"
    t.integer "related_post_id"
  end

  add_index "blogelator_posts_posts", ["post_id"], name: "index_blogelator_posts_posts_on_post_id"
  add_index "blogelator_posts_posts", ["related_post_id"], name: "index_blogelator_posts_posts_on_related_post_id"

  create_table "blogelator_posts_tags", force: :cascade do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  add_index "blogelator_posts_tags", ["post_id"], name: "index_blogelator_posts_tags_on_post_id"
  add_index "blogelator_posts_tags", ["tag_id"], name: "index_blogelator_posts_tags_on_tag_id"

  create_table "blogelator_tags", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "blogelator_tags", ["slug"], name: "index_blogelator_tags_on_slug"

  create_table "blogo_posts", force: :cascade do |t|
    t.integer  "user_id",          null: false
    t.string   "permalink",        null: false
    t.string   "title",            null: false
    t.boolean  "published",        null: false
    t.datetime "published_at",     null: false
    t.string   "markup_lang",      null: false
    t.text     "raw_content",      null: false
    t.text     "html_content",     null: false
    t.text     "html_overview"
    t.string   "tags_string"
    t.string   "meta_description", null: false
    t.string   "meta_image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogo_posts", ["permalink"], name: "index_blogo_posts_on_permalink", unique: true
  add_index "blogo_posts", ["published_at"], name: "index_blogo_posts_on_published_at"
  add_index "blogo_posts", ["user_id"], name: "index_blogo_posts_on_user_id"

  create_table "blogo_taggings", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "tag_id",  null: false
  end

  add_index "blogo_taggings", ["tag_id", "post_id"], name: "index_blogo_taggings_on_tag_id_and_post_id", unique: true

  create_table "blogo_tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogo_tags", ["name"], name: "index_blogo_tags_on_name", unique: true

  create_table "blogo_users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogo_users", ["email"], name: "index_blogo_users_on_email", unique: true

  create_table "categories", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descripcion"
    t.integer  "posicion"
    t.boolean  "visible"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "fotos", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descripcion"
    t.integer  "posicion"
    t.boolean  "visible"
    t.integer  "galery_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "fotos", ["galery_id"], name: "index_fotos_on_galery_id"

  create_table "galeries", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descripcion"
    t.integer  "posicion"
    t.boolean  "visible"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "galeries", ["category_id"], name: "index_galeries_on_category_id"

  create_table "presentacions", force: :cascade do |t|
    t.integer  "posicion"
    t.integer  "foto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "presentacions", ["foto_id"], name: "index_presentacions_on_foto_id"

end
