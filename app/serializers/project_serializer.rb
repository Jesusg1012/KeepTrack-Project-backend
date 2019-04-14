class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :color, :title
  has_many :lists
  has_many :reminders
end
