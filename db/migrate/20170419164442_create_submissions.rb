class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
    	t.integer :profile_id
    	t.integer :recruiter_id
    	t.integer :requirement_id
      t.timestamps
    end
  end
end
