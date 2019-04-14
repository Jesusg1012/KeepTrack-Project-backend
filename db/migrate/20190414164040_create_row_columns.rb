class CreateRowColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :row_columns do |t|
      t.integer :row_id
      t.integer :column_id
      t.string :content
      t.timestamps
    end
  end
end
