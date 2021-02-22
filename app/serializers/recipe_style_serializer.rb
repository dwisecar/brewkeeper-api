class RecipeStyleSerializer < ActiveModel::Serializer
  attributes :id
  has_one :recipe
  has_one :style
end
