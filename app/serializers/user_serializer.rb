class UserSerializer < ActiveModel::Serializer
  attributes :username, :id, :ratings, :reviews, :bio, :avatar
  has_many :recipes, include_nested_associations: true
end
