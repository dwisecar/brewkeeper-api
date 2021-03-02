class AddImageToStyles < ActiveRecord::Migration[6.1]
  def change
    add_column :styles, :image, :string
  end
end
