class Video < ActiveRecord::Base
  # Assocations
  belongs_to :user
  belongs_to :theme

  # Validations
  validates :user, :theme, :location, :background_color, presence: true
end
