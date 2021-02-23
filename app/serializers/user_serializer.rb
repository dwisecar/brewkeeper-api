class UserSerializer < ActiveModel::Serializer
  attributes :username, :id, :recipes
end
