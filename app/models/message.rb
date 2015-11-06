class Message < ActiveRecord::Base
  # Associations
  belongs_to :recipient, class_name: 'User'

  # Validations
  validates :sender_name, :sender_email, :body, :recipient, presence: true
  validates :sender_email, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }
end
