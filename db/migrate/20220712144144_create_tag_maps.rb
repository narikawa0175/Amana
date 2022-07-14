class CreateTagMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_maps do |t|
      t.integer :task_id,null: false
      t.integer :tag_id,null: false

      t.timestamps
    end
  end
end
