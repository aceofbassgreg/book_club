class Option < ApplicationRecord
  belongs_to :poll
  has_many :user_options
end
