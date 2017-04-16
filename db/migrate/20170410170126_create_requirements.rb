class CreateRequirements < ActiveRecord::Migration[5.0]
  def change
    create_table :requirements do |t|
    	t.string :skills, array: true, default: []
    	t.string :city
    	t.string :state
    	t.integer :experience
    	t.integer :manager_id
      t.timestamps
    end
  end
end
