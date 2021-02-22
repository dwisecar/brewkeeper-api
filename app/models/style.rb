class Style < ApplicationRecord
  has_many :recipe_styles
  has_many :recipes, through: :recipe_styles
end
