class CreateRequirements < ActiveRecord::Migration[5.0]
  def change
    create_table :requirements do |t|
    	t.integer :skill_ids, array: true, default: []
    	t.integer :user_id
      t.timestamps
    end
  end
end
