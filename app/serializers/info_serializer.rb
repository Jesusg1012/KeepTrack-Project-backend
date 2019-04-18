class InfoSerializer < ActiveModel::Serializer
  attributes :id, :name, :list_id
  has_many :name_infos
end
