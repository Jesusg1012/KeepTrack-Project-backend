class NameInfo < ApplicationRecord
  belongs_to :name
  belongs_to :info
  default_scope { order(id: :asc)}
end
