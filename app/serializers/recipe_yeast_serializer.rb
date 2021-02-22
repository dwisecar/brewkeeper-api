class RecipeYeastSerializer < ActiveModel::Serializer
  attributes :id
  has_one :recipe
  has_one :yeast
end
