class ReminderSerializer < ActiveModel::Serializer
  attributes :id, :description, :time, :email, :phone, :title
end
