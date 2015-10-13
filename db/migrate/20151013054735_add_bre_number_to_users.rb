class AddBreNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bre_number, :string
  end
end
