class Poll < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :user_book_votes, through: :books

  accepts_nested_attributes_for :books
  accepts_nested_attributes_for :user_book_votes

  validates :active_starting_at, presence: true
  validates :active_ending_at, presence: true

  belongs_to :event

  enum poll_type: { book: 'book', date: 'date' }

  def book_score_results
    book_ids = user_book_votes.pluck(:book_id).uniq
    book_ids.map do |id|
      {
        book_id: id,
        book_score: book_score(id) / user_book_votes.where(book_id: id).count
      }
    end
  end

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
