class AddBrokerLogoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :broker_logo, :string
  end
end
