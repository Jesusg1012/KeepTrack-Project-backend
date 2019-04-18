class Name < ApplicationRecord
  has_many :name_infos, :dependent => :destroy
  belongs_to :list
  has_many :infos, through: :name_infos
  default_scope { order(id: :asc)}
end
