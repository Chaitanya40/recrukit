class AddExperienceToRequirement < ActiveRecord::Migration[5.0]
  def change
  	add_column :requirements, :experience, :string
  end
end
