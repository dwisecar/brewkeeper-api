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

ActiveRecord::Schema.define(version: 2021_02_23_224029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fermentables", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "category_display"
    t.integer "srm_id"
    t.integer "srm_precise"
    t.integer "moisture_content"
    t.float "course_fine_difference"
    t.integer "dry_yield"
    t.float "potential"
    t.float "protein"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hops", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "country_of_origin"
    t.float "alpha_acid_min"
    t.float "beta_acid_min"
    t.float "beta_acid_max"
    t.float "humulene_min"
    t.float "humulene_max"
    t.float "caryophyllene_min"
    t.float "caryophyllene_max"
    t.float "cohumulone_min"
    t.float "cohumulone_max"
    t.float "myrcene_min"
    t.float "myrcene_max"
    t.float "farnesene_min"
    t.float "farnesene_max"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recipe_fermentables", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "fermentable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "amount"
    t.index ["fermentable_id"], name: "index_recipe_fermentables_on_fermentable_id"
    t.index ["recipe_id"], name: "index_recipe_fermentables_on_recipe_id"
  end

  create_table "recipe_hops", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "hop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "amount"
    t.integer "addition_time"
    t.boolean "boil_addition", default: true
    t.index ["hop_id"], name: "index_recipe_hops_on_hop_id"
    t.index ["recipe_id"], name: "index_recipe_hops_on_recipe_id"
  end

  create_table "recipe_styles", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "style_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_recipe_styles_on_recipe_id"
    t.index ["style_id"], name: "index_recipe_styles_on_style_id"
  end

  create_table "recipe_yeasts", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "yeast_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "amount"
    t.index ["recipe_id"], name: "index_recipe_yeasts_on_recipe_id"
    t.index ["yeast_id"], name: "index_recipe_yeasts_on_yeast_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "description"
    t.float "volume"
    t.string "instructions"
    t.string "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.string "description"
    t.string "ibu_min"
    t.string "ibu_max"
    t.string "abv_min"
    t.string "abv_max"
    t.string "srm_min"
    t.string "srm_max"
    t.string "og"
    t.string "fg_min"
    t.string "fg_max"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "bio"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "yeasts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "yeast_type"
    t.integer "attenuation_min"
    t.integer "attenuation_max"
    t.integer "ferment_temp_min"
    t.integer "ferment_temp_max"
    t.integer "alcohol_tolerance_min"
    t.integer "alcohol_tolerance_max"
    t.string "supplier"
    t.string "yeast_format"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "recipe_fermentables", "fermentables"
  add_foreign_key "recipe_fermentables", "recipes"
  add_foreign_key "recipe_hops", "hops"
  add_foreign_key "recipe_hops", "recipes"
  add_foreign_key "recipe_styles", "recipes"
  add_foreign_key "recipe_styles", "styles"
  add_foreign_key "recipe_yeasts", "recipes"
  add_foreign_key "recipe_yeasts", "yeasts"
  add_foreign_key "recipes", "users"
end
