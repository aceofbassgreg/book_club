class Poll < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :user_book_votes, through: :books

  accepts_nested_attributes_for :books
  accepts_nested_attributes_for :user_book_votes

  def book_score(book_id)
    opts = user_book_votes.where(book_id: book_id)
    opts.pluck(:score).inject(:+)
  end
end
