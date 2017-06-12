class CreateClientContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :client_contacts do |t|
    	t.string :email
    	t.string :first_name
    	t.string :last_name
      t.timestamps
    end
  end
end
