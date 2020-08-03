class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true
  has_secure_password

  # Assign an API key on create
  before_create do |user|
    user.api_key = user.generate_api_key
  end

  # Generate a unique API key
  def generate_api_key
    #loop do
      #token = 
      SecureRandom.base64
      #.tr('+/=', 'Qrt')
      #break token unless User.exists?
      #api_key: token
    end
  #end
end
#end 