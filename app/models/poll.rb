class Poll < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :user_book_votes, through: :books

  belongs_to :event

  accepts_nested_attributes_for :books
  accepts_nested_attributes_for :user_book_votes

  enum poll_type: { book: 'book', date: 'date' }

  def book_score(book_id)
    opts = user_book_votes.where(book_id: book_id)
    opts.pluck(:score).inject(:+)
  end

  def winner
    user_book_votes.order('score DESC').first.book
  end

  def active?
    Time.now < active_ending_at
  end

  def event_name
    event.name
  end
end
