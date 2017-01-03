class User < ApplicationRecord
  include Clearance::User
  enum status: {:admin => 0, :moderator => 1, :customer => 2}

  # attr_accessor :remember_token
  before_save :create_remember_token
  has_many :authentications, :dependent => :destroy
  has_many :listings
  has_many :bookings
  mount_uploader :avatar, AvatarUploader
  

  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = User.new(name: auth_hash["info"]["name"], email: auth_hash["extra"]["raw_info"]["email"])
    user.authentications << (authentication)
    user.save

    user
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end

  # private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
