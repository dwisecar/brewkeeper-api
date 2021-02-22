class RecipeFermentableSerializer < ActiveModel::Serializer
  attributes :id
  has_one :recipe
  has_one :fermentable
end
