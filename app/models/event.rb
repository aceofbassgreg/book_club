class Event < ActiveRecord::Base
  has_many :polls, dependent: :destroy
  has_many :books, through: :polls
  has_many :user_book_votes, through: :books

  accepts_nested_attributes_for :polls

  # Assumes there is only one book poll per event
  def book_poll
    polls.find_by(poll_type: :book)
  end

  def active?
    polls.any?(&:active?)
  end
end
