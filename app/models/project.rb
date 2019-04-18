class Project < ApplicationRecord
  belongs_to :user
  has_many :reminders,  as: :imageable
  has_many :lists
  validates :title, uniqueness: { case_sensitive: false }
  default_scope { order(id: :asc)}
end
