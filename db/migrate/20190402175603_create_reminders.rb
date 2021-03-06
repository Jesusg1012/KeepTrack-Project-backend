class CreateReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :reminders do |t|
      t.integer :imageable_id
      t.string  :imageable_type
      t.string :title
      t.string :description
      t.datetime :time
      t.boolean :email, default: true
      t.boolean :phone, default: false
      t.string :sort_by, default: "title"
      t.string :sort_order, default: "asc"
      t.boolean :active, default: false
      t.timestamps
    end
  end
end
