class CreateRecipeFermentables < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_fermentables do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :fermentable, null: false, foreign_key: true

      t.timestamps
    end
  end
end
