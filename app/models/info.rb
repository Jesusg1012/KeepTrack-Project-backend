class Info < ApplicationRecord
  belongs_to :list
  has_many :name_infos, :dependent => :destroy
  has_many :names, through: :name_infos
  default_scope { order(id: :asc)}
end
