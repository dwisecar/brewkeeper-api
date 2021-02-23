class AddBoilAdditionToRecipeHops < ActiveRecord::Migration[6.1]
  def change
    add_column :recipe_hops, :boil_addition, :boolean, :default => true
  end
end
