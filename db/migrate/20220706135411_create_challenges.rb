class CreateChallenges < ActiveRecord::Migration[6.1]
  def change
    create_table :challenges do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.boolean :complete, null: false, default: false
      t.datetime :start_time
      t.timestamps
    end
  end
end
