class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :volume, :instructions, :notes
  has_one :user
end
