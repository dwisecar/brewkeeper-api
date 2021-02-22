class CreateRecipeYeasts < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_yeasts do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :yeast, null: false, foreign_key: true

      t.timestamps
    end
  end
end
