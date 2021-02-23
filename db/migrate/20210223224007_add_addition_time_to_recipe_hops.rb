class AddAdditionTimeToRecipeHops < ActiveRecord::Migration[6.1]
  def change
    add_column :recipe_hops, :addition_time, :integer
  end
end
