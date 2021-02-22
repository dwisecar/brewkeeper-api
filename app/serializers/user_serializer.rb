class UserSerializer < ActiveModel::Serializer
  attributes :username, :id, :recipes, :avatar, :bio
end
