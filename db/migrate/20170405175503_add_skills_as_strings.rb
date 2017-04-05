class AddSkillsAsStrings < ActiveRecord::Migration[5.0]
  def change
  	add_column :requirements, :skills, :string, array: true, default: []
  	add_column :requirements, :experience_level, :integer, :default => 0
  end
end
