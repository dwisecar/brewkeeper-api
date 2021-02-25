class UserSerializer < ActiveModel::Serializer
  attributes :username, :id, :ratings, :reviews
  has_many :recipes, include_nested_associations: true
end
