class Item < ApplicationRecord
  belongs_to :list
  has_many :reminders,  as: :imageable
end
