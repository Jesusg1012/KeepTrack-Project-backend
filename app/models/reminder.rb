class Reminder < ApplicationRecord
   belongs_to :imageable, polymorphic: true
   default_scope { order(time: :asc)}
   # if :sort_order == "asc"
   #   if :sort_by == "title"
   #     default_scope { order(title: :asc)}
   #   elsif :sort_by == "date"
   #     default_scope { order(date: :asc)}
   #   elsif :sort_by == "updated"
   #     default_scope { order(updated_at: :asc)}
   #   end
   # else
   #   if :sort_by == "title"
   #     default_scope { order(title: :asc)}
   #   elsif :sort_by == "date"
   #     default_scope { order(date: :asc)}
   #   elsif :sort_by == "updated"
   #     default_scope { order(updated_at: :asc)}
   #   end
   # end
   def time
     self[:time].to_f * 1000
   end
     def change(type, text)
       if type=="title"
         self[:title] = text
       elsif type=="description"
         self[:description] = text
       elsif type == "time"
         self[:time] = Time.at( text / 1000.0 )
         if self[:time] > DateTime.now
           self[:active] = true
         else
           self[:active] = false
         end
        end
     end
end
