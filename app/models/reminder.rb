class Reminder < ApplicationRecord
   belongs_to :imageable, polymorphic: true
    default_scope { order(id: :desc)}
   def time
     if self[:time]
       self[:time].strftime('%b %d %Y Time: %I:%M %P')
     else
       nil
     end
   end
     def change(type, text)
       if type=="title"
         self[:title] = text
       elsif type=="description"
         self[:description] = text
       end
     end
end
