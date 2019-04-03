class CreateReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :reminders do |t|
      t.integer :imageable_id
      t.string  :imageable_type
      t.string :title
      t.string :description
      t.datetime :time
      t.timestamps
    end
  end
end
