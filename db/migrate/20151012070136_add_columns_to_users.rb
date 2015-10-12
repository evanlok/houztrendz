class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :title, :string
    add_column :users, :phone, :string
    add_column :users, :biography, :text
    add_column :users, :avatar, :string
  end
end
