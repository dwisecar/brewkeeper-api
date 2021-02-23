class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :volume, :instructions, :notes, :styles, :fermentables, :hops, :yeasts
  has_one :user
end
