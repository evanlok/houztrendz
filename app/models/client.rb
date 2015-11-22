class Client < ActiveRecord::Base

  belongs_to :user, :inverse_of => :clients
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }, allow_blank: true
  validates :email, presence: true, uniqueness: true
  validates :zip_code, presence: true, numericality: { only_integer:  true }


def full_name
  "#{first_name} #{last_name}"
end

end
