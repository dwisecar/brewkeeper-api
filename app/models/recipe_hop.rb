class RecipeHop < ApplicationRecord
  belongs_to :recipe
  belongs_to :hop
  accepts_nested_attributes_for :hop
end
