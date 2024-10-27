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

ActiveRecord::Schema[7.0].define(version: 2024_10_26_121428) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_group", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 150, null: false
    t.index ["name"], name: "auth_group_name_a6ea08ec_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "auth_group_name_key", unique: true
  end

  create_table "auth_group_permissions", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "permission_id", null: false
    t.index ["group_id", "permission_id"], name: "auth_group_permissions_group_id_permission_id_0cd325b0_uniq", unique: true
    t.index ["group_id"], name: "auth_group_permissions_group_id_b120cbf9"
    t.index ["permission_id"], name: "auth_group_permissions_permission_id_84c5c92e"
  end

  create_table "auth_permission", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "content_type_id", null: false
    t.string "codename", limit: 100, null: false
    t.index ["content_type_id", "codename"], name: "auth_permission_content_type_id_codename_01ab375a_uniq", unique: true
    t.index ["content_type_id"], name: "auth_permission_content_type_id_2f476e4b"
  end

  create_table "auth_user", id: :integer, default: nil, force: :cascade do |t|
    t.string "password", limit: 128, null: false
    t.timestamptz "last_login"
    t.boolean "is_superuser", null: false
    t.string "username", limit: 150, null: false
    t.string "first_name", limit: 150, null: false
    t.string "last_name", limit: 150, null: false
    t.string "email", limit: 254, null: false
    t.boolean "is_staff", null: false
    t.boolean "is_active", null: false
    t.timestamptz "date_joined", null: false
    t.index ["username"], name: "auth_user_username_6821ab7c_like", opclass: :varchar_pattern_ops
    t.index ["username"], name: "auth_user_username_key", unique: true
  end

  create_table "auth_user_groups", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.index ["group_id"], name: "auth_user_groups_group_id_97559544"
    t.index ["user_id", "group_id"], name: "auth_user_groups_user_id_group_id_94350c0c_uniq", unique: true
    t.index ["user_id"], name: "auth_user_groups_user_id_6a12ed8b"
  end

  create_table "auth_user_user_permissions", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "permission_id", null: false
    t.index ["permission_id"], name: "auth_user_user_permissions_permission_id_1fbb5f2c"
    t.index ["user_id", "permission_id"], name: "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq", unique: true
    t.index ["user_id"], name: "auth_user_user_permissions_user_id_a95ead1b"
  end

  create_table "authtoken_token", primary_key: "key", id: { type: :string, limit: 40 }, force: :cascade do |t|
    t.timestamptz "created", null: false
    t.integer "user_id", null: false
    t.index ["key"], name: "authtoken_token_key_10f0b77e_like", opclass: :varchar_pattern_ops
    t.index ["user_id"], name: "authtoken_token_user_id_key", unique: true
  end

  create_table "cars_address", id: :bigint, default: nil, force: :cascade do |t|
    t.string "street_address", limit: 255, null: false
    t.string "city", limit: 255, null: false
    t.string "state", limit: 255, null: false
    t.string "zip_code", limit: 255, null: false
    t.bigint "car_id", null: false
    t.index ["car_id"], name: "cars_address_car_id_key", unique: true
  end

  create_table "cars_cars", id: :bigint, default: nil, force: :cascade do |t|
    t.string "care_name", limit: 100, null: false
    t.string "car_version", limit: 300, null: false
    t.string "car_model", limit: 300, null: false
    t.string "brand", limit: 200, null: false
    t.bigint "max_speed", null: false
    t.string "coutry", limit: 200, null: false
    t.timestamptz "created_at", null: false
    t.timestamptz "updated_at", null: false
    t.bigint "mix_speed", null: false
    t.check_constraint "max_speed >= 0", name: "cars_cars_max_speed_check"
    t.check_constraint "mix_speed >= 0", name: "cars_cars_mix_speed_check"
  end

  create_table "cars_cars_tags", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "cars_id", null: false
    t.bigint "tag_id", null: false
    t.index ["cars_id", "tag_id"], name: "cars_cars_tags_cars_id_tag_id_69a4525c_uniq", unique: true
    t.index ["cars_id"], name: "cars_cars_tags_cars_id_69011742"
    t.index ["tag_id"], name: "cars_cars_tags_tag_id_7e9d3242"
  end

  create_table "cars_fixhistory", id: :bigint, default: nil, force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.string "desc", limit: 255, null: false
    t.bigint "car_id", null: false
    t.index ["car_id"], name: "cars_fixhistory_car_id_40821dd2"
  end

  create_table "cars_tag", id: :bigint, default: nil, force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  create_table "certificate_certificate", id: :bigint, default: nil, force: :cascade do |t|
    t.string "user_name", limit: 255, null: false
    t.string "certificate_image", limit: 100, null: false
    t.timestamptz "timestamp", null: false
  end

  create_table "django_admin_log", id: :integer, default: nil, force: :cascade do |t|
    t.timestamptz "action_time", null: false
    t.text "object_id"
    t.string "object_repr", limit: 200, null: false
    t.integer "action_flag", limit: 2, null: false
    t.text "change_message", null: false
    t.integer "content_type_id"
    t.integer "user_id", null: false
    t.index ["content_type_id"], name: "django_admin_log_content_type_id_c4bce8eb"
    t.index ["user_id"], name: "django_admin_log_user_id_c564eba6"
    t.check_constraint "action_flag >= 0", name: "django_admin_log_action_flag_check"
  end

  create_table "django_content_type", id: :integer, default: nil, force: :cascade do |t|
    t.string "app_label", limit: 100, null: false
    t.string "model", limit: 100, null: false
    t.index ["app_label", "model"], name: "django_content_type_app_label_model_76bd3d3b_uniq", unique: true
  end

  create_table "django_migrations", id: :bigint, default: nil, force: :cascade do |t|
    t.string "app", limit: 255, null: false
    t.string "name", limit: 255, null: false
    t.timestamptz "applied", null: false
  end

  create_table "django_session", primary_key: "session_key", id: { type: :string, limit: 40 }, force: :cascade do |t|
    t.text "session_data", null: false
    t.timestamptz "expire_date", null: false
    t.index ["expire_date"], name: "django_session_expire_date_a5c62663"
    t.index ["session_key"], name: "django_session_session_key_c0390e0f_like", opclass: :varchar_pattern_ops
  end

  create_table "lists_list", id: :bigint, default: nil, force: :cascade do |t|
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.string "name", limit: 255, null: false
    t.text "description"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "lists_list_user_id_2731f1b1"
  end

  create_table "lists_listitem", id: :bigint, default: nil, force: :cascade do |t|
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.string "text", limit: 255, null: false
    t.bigint "parent_list_id", null: false
    t.index ["parent_list_id"], name: "lists_listitem_parent_list_id_eabaf283"
  end

  create_table "logs_log", id: :bigint, default: nil, force: :cascade do |t|
    t.string "photo", limit: 100, null: false
    t.boolean "is_correct", null: false
    t.timestamptz "created", null: false
    t.bigint "profile_id"
    t.index ["profile_id"], name: "logs_log_profile_id_41ff81c7"
  end

  create_table "profiles_profile", id: :bigint, default: nil, force: :cascade do |t|
    t.string "photo", limit: 100, null: false
    t.timestamptz "bio", null: false
    t.integer "user_id", null: false
    t.text "created", null: false
    t.index ["user_id"], name: "profiles_profile_user_id_key", unique: true
  end

  create_table "projects_project", id: :bigint, default: nil, force: :cascade do |t|
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.string "title", limit: 100, null: false
    t.text "description", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "projects_project_user_id_719f19dd"
  end

  create_table "task_tag", id: :bigint, default: nil, force: :cascade do |t|
    t.string "text", limit: 25, null: false
    t.string "color", limit: 6, null: false
  end

  create_table "task_tag_tasks", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "task_id", null: false
    t.index ["tag_id", "task_id"], name: "task_tag_tasks_tag_id_task_id_54fb1386_uniq", unique: true
    t.index ["tag_id"], name: "task_tag_tasks_tag_id_46271887"
    t.index ["task_id"], name: "task_tag_tasks_task_id_be0d3bb7"
  end

  create_table "task_task", id: :bigint, default: nil, force: :cascade do |t|
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.string "title", limit: 100, null: false
    t.text "description", null: false
    t.boolean "completed", null: false
    t.date "date"
    t.integer "category", null: false
    t.bigint "project_id"
    t.integer "user_id", null: false
    t.index ["project_id"], name: "task_task_project_id_0d03694f"
    t.index ["user_id"], name: "task_task_user_id_5330ed4b"
  end

  create_table "uploads_certificate", id: :bigint, default: nil, force: :cascade do |t|
    t.string "user_name", limit: 255, null: false
    t.string "certificate_image", limit: 100, null: false
    t.timestamptz "timestamp", null: false
  end

  create_table "uploads_upload", id: :bigint, default: nil, force: :cascade do |t|
    t.string "image", limit: 100, null: false
    t.string "action", limit: 250, null: false
    t.timestamptz "updated", null: false
    t.timestamptz "created", null: false
  end

  create_table "users_user", id: :bigint, default: nil, force: :cascade do |t|
    t.string "password", limit: 128, null: false
    t.timestamptz "last_login"
    t.string "email", limit: 255, null: false
    t.boolean "is_active", null: false
    t.boolean "is_admin", null: false
    t.boolean "is_staff", null: false
    t.index ["email"], name: "users_user_email_243f6e77_like", opclass: :varchar_pattern_ops
    t.index ["email"], name: "users_user_email_key", unique: true
  end

  create_table "users_userprofile", primary_key: "user_id", id: :bigint, default: nil, force: :cascade do |t|
    t.string "first_name", limit: 100, null: false
    t.string "last_name", limit: 100, null: false
    t.string "image", limit: 100, null: false
    t.string "fb_profile", limit: 100, null: false
    t.string "twitter_profile", limit: 100, null: false
    t.string "linkedin_profile", limit: 100, null: false
    t.string "website", limit: 100, null: false
  end

  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id", deferrable: :deferred
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm", deferrable: :deferred
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "auth_permission_content_type_id_2f476e4b_fk_django_co", deferrable: :deferred
  add_foreign_key "auth_user_groups", "auth_group", column: "group_id", name: "auth_user_groups_group_id_97559544_fk_auth_group_id", deferrable: :deferred
  add_foreign_key "auth_user_groups", "auth_user", column: "user_id", name: "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "auth_user_user_permissions", "auth_permission", column: "permission_id", name: "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm", deferrable: :deferred
  add_foreign_key "auth_user_user_permissions", "auth_user", column: "user_id", name: "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "authtoken_token", "auth_user", column: "user_id", name: "authtoken_token_user_id_35299eff_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "cars_address", "cars_cars", column: "car_id", name: "cars_address_car_id_ebfdab1c_fk_cars_cars_id", deferrable: :deferred
  add_foreign_key "cars_cars_tags", "cars_cars", column: "cars_id", name: "cars_cars_tags_cars_id_69011742_fk_cars_cars_id", deferrable: :deferred
  add_foreign_key "cars_cars_tags", "cars_tag", column: "tag_id", name: "cars_cars_tags_tag_id_7e9d3242_fk_cars_tag_id", deferrable: :deferred
  add_foreign_key "cars_fixhistory", "cars_cars", column: "car_id", name: "cars_fixhistory_car_id_40821dd2_fk_cars_cars_id", deferrable: :deferred
  add_foreign_key "django_admin_log", "auth_user", column: "user_id", name: "django_admin_log_user_id_c564eba6_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "django_admin_log_content_type_id_c4bce8eb_fk_django_co", deferrable: :deferred
  add_foreign_key "lists_list", "auth_user", column: "user_id", name: "lists_list_user_id_2731f1b1_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "lists_listitem", "lists_list", column: "parent_list_id", name: "lists_listitem_parent_list_id_eabaf283_fk_lists_list_id", deferrable: :deferred
  add_foreign_key "logs_log", "profiles_profile", column: "profile_id", name: "logs_log_profile_id_41ff81c7_fk_profiles_profile_id", deferrable: :deferred
  add_foreign_key "profiles_profile", "auth_user", column: "user_id", name: "profiles_profile_user_id_a3e81f91_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "projects_project", "auth_user", column: "user_id", name: "projects_project_user_id_719f19dd_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "task_tag_tasks", "task_tag", column: "tag_id", name: "task_tag_tasks_tag_id_46271887_fk_task_tag_id", deferrable: :deferred
  add_foreign_key "task_tag_tasks", "task_task", column: "task_id", name: "task_tag_tasks_task_id_be0d3bb7_fk_task_task_id", deferrable: :deferred
  add_foreign_key "task_task", "auth_user", column: "user_id", name: "task_task_user_id_5330ed4b_fk_auth_user_id", deferrable: :deferred
  add_foreign_key "task_task", "projects_project", column: "project_id", name: "task_task_project_id_0d03694f_fk_projects_project_id", deferrable: :deferred
  add_foreign_key "users_userprofile", "users_user", column: "user_id", name: "users_userprofile_user_id_87251ef1_fk_users_user_id", deferrable: :deferred
end
