class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :list_id, null: false
      t.string :name, null: false
      t.text :explanation
      t.boolean :complete, null: false, default: false
      t.datetime :start_time
      t.datetime :finish_time
      t.timestamps
    end
  end
end
