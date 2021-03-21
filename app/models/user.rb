require 'bcrypt'

class User < ApplicationRecord
  has_secure_password
  has_many :books
  has_many :user_book_votes

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 10 }

  def finished_voting_in_poll?(poll_id)
    votes = votes_for_poll(poll_id)
    books = Poll.find(poll_id).books
    votes.pluck(:book_id).sort == books.pluck(:id).sort && !books.empty?
  end

  def admin?
    admin
  end

  private

  def votes_for_poll(poll_id)
    UserBookVote.joins(:book).where(book: { poll_id: poll_id })
  end
end
