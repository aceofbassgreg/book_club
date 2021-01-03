require 'bcrypt'

class User < ApplicationRecord
  has_secure_password
  has_many :user_options

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 10 }
end
