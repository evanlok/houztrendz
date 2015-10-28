class CoreLogicLocation < ActiveRecord::Base
  # Validations
  validates :date, :county_name, :state, :zip_code, presence: true
  validates :zip_code, uniqueness: { scope: :date }
end
