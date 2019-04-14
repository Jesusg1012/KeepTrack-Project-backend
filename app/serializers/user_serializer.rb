class UserSerializer < ActiveModel::Serializer
  has_many :reminders
  has_many :projects, serializer: UserProjectSerializer
  attributes :username, :name, :avatar, :bio, :email, :number

end
