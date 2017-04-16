class CreateAssignedRequirements < ActiveRecord::Migration[5.0]
  def change
    create_table :assigned_requirements do |t|
    	t.integer :manager_id
    	t.integer :requirement_id
    	t.integer :recruiter_id
      t.timestamps
    end
  end
end
