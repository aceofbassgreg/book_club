class Book < ApplicationRecord
  belongs_to :poll
  has_many :user_book_votes

  validates :title, uniqueness: { scope: :poll, message: 'must be uniqe per poll' }
end
