class UserSerializer < ActiveModel::Serializer
  attributes :username, :name, :avatar, :bio, :email, :number
end
