class List < ApplicationRecord
  belongs_to :project
  has_many :rows
  has_many :columns
  validates :title, uniqueness: { case_sensitive: false }
end
