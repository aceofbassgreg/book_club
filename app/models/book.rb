class Book < ApplicationRecord
  belongs_to :poll
  has_many :user_book_votes, dependent: :destroy

  accepts_nested_attributes_for :user_book_votes

  validates :title, presence: true
  validates :author, presence: true
end
