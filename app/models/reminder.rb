class Reminder < ApplicationRecord
   belongs_to :imageable, polymorphic: true
   def time
     self[:time].strftime('%b %d %Y Time: %I:%M %P')
   end
end
