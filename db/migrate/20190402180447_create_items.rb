class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :list_id
      t.string :content
      t.integer :number
      t.timestamps
    end
  end
end
