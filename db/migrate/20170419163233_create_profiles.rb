class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
    	t.string :skills
    	t.string :experience
    	t.string :city
    	t.string :state
    	t.string :resume
      t.timestamps
    end
  end
end
