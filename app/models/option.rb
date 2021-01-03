class Option < ApplicationRecord
  belongs_to :poll
  has_many :user_options

  validates :title, uniqueness: { scope: :poll, message: 'must be uniqe per poll' }
end
