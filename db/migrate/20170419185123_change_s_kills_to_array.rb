class ChangeSKillsToArray < ActiveRecord::Migration[5.0]
  def change
  	remove_column :profiles, :skills
  	add_column :profiles, :skills, :string, array: true, default: '{}'
  end
end
