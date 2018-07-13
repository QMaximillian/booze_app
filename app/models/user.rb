class User < ApplicationRecord

  has_many :user_alcohols
  has_many :alcohols, through: :user_alcohols
  has_secure_password
  validates :email, uniqueness: true
  validates :password, length: {minimum: 6, maximum: 100}

end

