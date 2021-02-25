class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :volume, :instructions, :notes, :styles, :fermentables, :hops, :yeasts, :ratings 
  has_many :reviews, include_nested_associations: true
  has_one :user, include_nested_associations: true
end
