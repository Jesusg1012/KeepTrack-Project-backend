class ListSerializer < ActiveModel::Serializer
  has_many :names
  has_many :infos, serializer: InfoSerializer
  has_many :name_infos
  attributes :id, :title, :description
end
