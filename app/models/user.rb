class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true
  has_secure_password

  before_create do |user|
    user.api_key = user.generate_api_key
  end

  def generate_api_key
      SecureRandom.base64
  end
end
