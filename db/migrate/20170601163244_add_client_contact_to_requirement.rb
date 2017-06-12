class AddClientContactToRequirement < ActiveRecord::Migration[5.0]
  def change
		add_column :requirements, :client_contact_id, :integer  
  end
end
