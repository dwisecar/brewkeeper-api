class CreateRecipeStyles < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_styles do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :style, null: false, foreign_key: true

      t.timestamps
    end
  end
end
