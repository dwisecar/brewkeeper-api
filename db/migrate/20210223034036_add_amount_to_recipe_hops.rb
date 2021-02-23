class AddAmountToRecipeHops < ActiveRecord::Migration[6.1]
  def change
    add_column :recipe_hops, :amount, :float
  end
end
