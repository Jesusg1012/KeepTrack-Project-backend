class MailingJob
  include SuckerPunch::Job

  def perform()
    test = Reminder.all.select { |reminder| reminder.active}
      while test
        test = Reminder.all.select { |reminder| reminder.active}
        Reminder.all.each do |reminder|
          if(reminder.active)
            if(reminder.time < DateTime.now.to_f * 1000)
              reminder.active = false
              reminder.save
              if reminder.phone
                reminder.imageable.sendText(reminder)
              end
              if reminder.email
              end
            end
          end
        end
        sleep 60
      end
  end
end
