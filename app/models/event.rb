class Event < ActiveRecord::Base
  has_many :polls, dependent: :destroy

  # Assumes there is only one book poll per event
  def book_poll
    polls.find_by(poll_type: :book)
  end

  def active?
    polls.any?(&:active?)
  end
end
