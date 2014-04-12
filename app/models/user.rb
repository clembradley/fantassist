class User < ActiveRecord::Base
  validates :email,
    format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, allow_blank: true},
    presence: true,
    uniqueness: true

  def email=(value)
    sanitized_value = value && value.strip.downcase
    write_attribute(:email, sanitized_value)
  end
end
