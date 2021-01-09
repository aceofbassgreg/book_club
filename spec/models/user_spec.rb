require 'rails_helper'

describe User do
  describe '#finished_voting_in_poll?' do
    let(:poll) { create(:poll) }
    let(:poll_books) do
      [1, 2].map { |i| create(:book, title: "Book #{i}", poll: poll) }
    end

    let(:user) { create(:user) }

    it 'returns true when user registered vote for all options in given poll' do
      poll_books.each { |b| create(:user_book_vote, book_id: b.id, user_id: user.id, score: 2) }
      expect(user.finished_voting_in_poll?(poll.id)).to be(true)
    end

    it 'returns false when there are no user options for a poll' do
      expect(user.finished_voting_in_poll?(poll.id)).to be(false)
    end

    it 'returns false when user has not voted for all poll books' do
      create(:user_book_vote, book_id: poll_books.first.id, user_id: user.id, score: 2)

      expect(user.finished_voting_in_poll?(poll.id)).to be(false)
    end
  end
end
