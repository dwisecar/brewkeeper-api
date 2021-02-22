class RecipeHopSerializer < ActiveModel::Serializer
  attributes :id
  has_one :recipe
  has_one :hop
end
