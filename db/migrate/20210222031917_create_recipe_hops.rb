class CreateRecipeHops < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_hops do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :hop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
