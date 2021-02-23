class AddAmountToRecipeFermentables < ActiveRecord::Migration[6.1]
  def change
    add_column :recipe_fermentables, :amount, :float
  end
end
