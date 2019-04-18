class Project < ApplicationRecord
  belongs_to :user
  has_many :reminders,  as: :imageable
  has_many :lists
  validates :title, presence: true
  default_scope { order(id: :asc)}
end
