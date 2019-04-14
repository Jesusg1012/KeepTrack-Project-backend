class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :title
      t.integer :project_id
      t.string :description
      t.timestamps
    end
  end
end
