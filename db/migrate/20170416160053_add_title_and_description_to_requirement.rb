class AddTitleAndDescriptionToRequirement < ActiveRecord::Migration[5.0]
  def change
  	add_column :requirements, :title, :string
  	add_column :requirements, :description, :text
  end
end
