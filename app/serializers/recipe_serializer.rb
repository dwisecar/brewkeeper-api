class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :volume, :instructions, :notes, :ratings 
end
