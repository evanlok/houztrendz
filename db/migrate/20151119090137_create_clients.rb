class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :zip_code
      t.integer :user_id
      t.text :notes
      t.string :customfield1
      t.string :customfield2
      t.timestamps null: false
    end
    add_index :clients, :user_id
  end
end
