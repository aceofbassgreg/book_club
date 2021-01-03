require 'bcrypt'

class User < ApplicationRecord
  has_secure_password
  has_many :user_options

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 10 }

  def finished_voting_in_poll?(poll_id)
    votes = UserOption.joins(:option).where(option: { poll_id: poll_id })
    options = Poll.find(poll_id).options
    votes.pluck(:option_id).sort == options.pluck(:id).sort && !options.empty?
  end
end
