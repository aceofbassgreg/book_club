class Book < ApplicationRecord
  belongs_to :poll, optional: true
  belongs_to :user
  has_many :user_book_votes, dependent: :destroy

  accepts_nested_attributes_for :user_book_votes

  validates :title, presence: true
  validates :author, presence: true

  def self.all_not_in_poll
    where(poll_id: nil)
  end
end
