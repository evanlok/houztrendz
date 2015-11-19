class Client < ActiveRecord::Base

  belongs_to :user, :inverse_of => :clients
  validates :first_name, :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  validates :email, presence: true, uniqueness: true
  validates :zip_code, numericality: { only_integer:  true }

end
