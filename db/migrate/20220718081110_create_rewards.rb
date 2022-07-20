class CreateRewards < ActiveRecord::Migration[6.1]
  def change
    create_table :rewards do |t|
      t.integer :user_id,null: false
      t.string :reward_name,null: false
      t.integer :cost_point,null: false

      t.timestamps
    end
  end
end
