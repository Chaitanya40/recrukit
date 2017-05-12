class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
    	t.string :email
    	t.string :first_name
    	t.string :last_name
    	t.string :company
    	t.integer :company_id
      t.timestamps
    end
  end
end