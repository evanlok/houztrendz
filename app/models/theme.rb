class Theme < ActiveRecord::Base
  VIDEO_TYPE = 'Houztrendz'.freeze

  # Associations
  has_many :videos, dependent: :nullify

  # Validations
  validates :name, :class_name, presence: true
end
