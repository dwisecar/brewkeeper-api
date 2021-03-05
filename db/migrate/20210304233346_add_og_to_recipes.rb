class AddOgToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :og, :float
    add_column :recipes, :fg, :float
    add_column :recipes, :abv, :float
    add_column :recipes, :ibu, :float
    add_column :recipes, :srm, :integer
  end
end
