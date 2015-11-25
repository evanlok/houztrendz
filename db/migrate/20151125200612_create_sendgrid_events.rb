class CreateSendgridEvents < ActiveRecord::Migration
  def change
    create_table :sendgrid_events do |t|
      t.string :email
      t.integer :timestamp
      t.integer :smtp_id
      t.string :user_agent
      t.string :event
      t.integer :client_id
      t.timestamps null: false
    end
    add_index :sendgrid_events, :client_id
  end
end
