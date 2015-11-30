class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:onvedeo]

  # Carrierwave
  mount_uploader :avatar, AvatarUploader
  mount_uploader :broker_logo, AvatarUploader

  # Assocations
  has_many :videos, dependent: :destroy
  has_many :clients, :inverse_of => :user, dependent: :destroy

  # Validations
  validates :first_name, :last_name, presence: true
  validates :phone, phony_plausible: true

  # Callbacks
  phony_normalize :phone, default_country_code: 'US'

  def self.from_onvedeo(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.phone = auth.info.phone
      user.biography = auth.info.description
      user.bre_number = auth.info.bre_number
      user.remote_avatar_url = auth.info.image
      user.remote_broker_logo_url = auth.info.company_logo
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end


  def get_open_rate(user_id)
    events = SendgridEvent.joins(client: :user).merge(User.where(id: user_id))
    opened = Float(events.where(event: "open").count)
    delivered = Float(events.where(event: "delivered").count)
    rate = opened/delivered
  end

  def get_open(user_id)
    events = SendgridEvent.joins(client: :user).merge(User.where(id: user_id))
    opened = events.where(event: "open").count
  end

  def get_clicks(user_id)
    events = SendgridEvent.joins(client: :user).merge(User.where(id: user_id))
    clicks = events.where(event:"click").count
  end

  def get_top_five_active_clients(user_id)
    events = SendgridEvent.joins(client: :user).merge(User.where(id: user_id))
    top_users = events.where(event:"open").order(email: :desc)
  end
end
