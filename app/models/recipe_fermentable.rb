class RecipeFermentable < ApplicationRecord
  belongs_to :recipe
  belongs_to :fermentable
  accepts_nested_attributes_for :fermentable
end
