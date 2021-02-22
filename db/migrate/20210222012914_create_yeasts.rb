class CreateYeasts < ActiveRecord::Migration[6.1]
  def change
    create_table :yeasts do |t|
      t.string :name
      t.string :description
      t.string :yeast_type
      t.integer :attenuation_min
      t.integer :attenuation_max
      t.integer :ferment_temp_min
      t.integer :ferment_temp_max
      t.integer :alcohol_tolerance_min
      t.integer :alcohol_tolerance_max
      t.string :supplier
      t.string :yeast_format

      t.timestamps
    end
  end
end
