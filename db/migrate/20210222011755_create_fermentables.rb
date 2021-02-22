class CreateFermentables < ActiveRecord::Migration[6.1]
  def change
    create_table :fermentables do |t|
      t.string :name
      t.string :description
      t.string :category_display
      t.integer :srm_id
      t.integer :srm_precise
      t.integer :moisture_content
      t.float :course_fine_difference
      t.integer :dry_yield
      t.float :potential
      t.float :protein

      t.timestamps
    end
  end
end
