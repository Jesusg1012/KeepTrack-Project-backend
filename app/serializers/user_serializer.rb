class UserSerializer < ActiveModel::Serializer
  has_many :reminders
  attributes :username, :name, :avatar, :bio, :email, :number

end
