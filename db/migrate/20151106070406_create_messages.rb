class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :sender_name
      t.string :sender_email
      t.string :sender_phone
      t.text :body
      t.belongs_to :recipient, index: true
      t.timestamps null: false
    end
  end
end
