class CreateNameInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :name_infos do |t|
      t.integer :name_id
      t.integer :info_id
      t.string :content
      t.timestamps
    end
  end
end
