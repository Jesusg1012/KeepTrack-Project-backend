class Reminder < ApplicationRecord
   belongs_to :imageable, polymorphic: true
end
