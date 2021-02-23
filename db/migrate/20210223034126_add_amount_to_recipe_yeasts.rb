class AddAmountToRecipeYeasts < ActiveRecord::Migration[6.1]
  def change
    add_column :recipe_yeasts, :amount, :float
  end
end
