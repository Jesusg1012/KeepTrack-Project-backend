class ReminderSerializer < ActiveModel::Serializer
  attributes :id, :description, :time, :email, :phone
end
