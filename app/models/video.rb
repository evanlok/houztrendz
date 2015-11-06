class Video < ActiveRecord::Base
  # Assocations
  belongs_to :user
  belongs_to :theme

  # Validations
  validates :user, :theme, :location, :background_color, presence: true

  def generate
    HALClient.new(self).generate
  end

  def core_logic_location
    @core_logic_location ||= CoreLogicLocation.where(zip_code: location).order(:date).last
  end
end
