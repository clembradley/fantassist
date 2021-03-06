class User < ActiveRecord::Base
  devise :trackable, :omniauthable, :omniauth_providers => [:google_oauth2]

  has_many :drafters, dependent: :destroy
  has_many :leagues, through: :drafters

  validates :email,
    format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, allow_blank: true},
    presence: true,
    uniqueness: true

  def self.from_omniauth(auth)
    if user = User.find_by(email: auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user
    else
      UserManager.first_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.email = auth.info.email
        user.image = auth.info.image
      end
    end
  end

  def email=(value)
    sanitized_value = value && value.strip.downcase
    write_attribute(:email, sanitized_value)
  end
end
