class CreateStyles < ActiveRecord::Migration[6.1]
  def change
    create_table :styles do |t|
      t.string :name
      t.string :short_name
      t.string :description
      t.string :ibu_min
      t.string :ibu_max
      t.string :abv_min
      t.string :abv_max
      t.string :srm_min
      t.string :srm_max
      t.string :og
      t.string :fg_min
      t.string :fg_max

      t.timestamps
    end
  end
end
