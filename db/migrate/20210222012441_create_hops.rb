class CreateHops < ActiveRecord::Migration[6.1]
  def change
    create_table :hops do |t|
      t.string :name
      t.string :description
      t.string :country_of_origin
      t.float :alpha_acid_min
      t.float :beta_acid_min
      t.float :beta_acid_max
      t.float :humulene_min
      t.float :humulene_max
      t.float :caryophyllene_min
      t.float :caryophyllene_max
      t.float :cohumulone_min
      t.float :cohumulone_max
      t.float :myrcene_min
      t.float :myrcene_max
      t.float :farnesene_min
      t.float :farnesene_max

      t.timestamps
    end
  end
end
