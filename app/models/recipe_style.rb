class RecipeStyle < ApplicationRecord
  belongs_to :recipe
  belongs_to :style
end
