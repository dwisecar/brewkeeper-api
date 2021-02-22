class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.float :volume
      t.string :instructions
      t.string :notes

      t.timestamps
    end
  end
end
