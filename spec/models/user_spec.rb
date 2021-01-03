require 'rails_helper'

describe User do
  describe '#finished_voting_in_poll?' do
    let(:poll) { create(:poll) }
    let(:poll_options) do
      [1, 2].map { |i| create(:option, title: "Book #{i}", poll: poll) }
    end

    let(:user) { create(:user) }

    it 'returns true when user registered vote for all options in given poll' do
      poll_options.each { |o| create(:user_option, option_id: o.id, user_id: user.id) }
      expect(user.finished_voting_in_poll?(poll.id)).to be(true)
    end

    it 'returns false when there are no user options for a poll' do
      expect(user.finished_voting_in_poll?(poll.id)).to be(false)
    end

    it 'returns false when user has not voted for all poll options' do
      create(:user_option, option_id: poll_options.first.id, user_id: user.id)

      expect(user.finished_voting_in_poll?(poll.id)).to be(false)
    end
  end
end
