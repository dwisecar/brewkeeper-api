class UserSerializer < ActiveModel::Serializer
  attributes :username, :id, :bio, :avatar, :ratings
end
