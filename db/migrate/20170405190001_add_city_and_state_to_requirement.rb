class AddCityAndStateToRequirement < ActiveRecord::Migration[5.0]
  def change
  	add_column :requirements, :state, :string
  	add_column :requirements, :city, :string
  end
end
