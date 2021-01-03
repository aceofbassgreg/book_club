require "rails_helper"

describe Poll do
  let(:poll) { create(:poll, name: "January 2021") }

  describe "#option_score" do
    let(:iliad) { create(:option, title: "The Iliad", poll: poll) }
    let(:odyssey) { create(:option, title: "The Odyssey", poll: poll) }

    let(:betty) do
      create(:user, first_name: "Betty", last_name: "Boop", email: "betty@boop.com")
    end

    let(:liz) do
      create(:user, first_name: "Liz", last_name: "Loop", email: "liz@loop.com")
    end

    it "calculates the total for a given poll option" do
      create(:user_option, user: liz, option: odyssey, score: 8)
      create(:user_option, user: betty, option: odyssey, score: 7)

      create(:user_option, user: liz, option: iliad, score: 2)

      expect(poll.option_score(odyssey.id)).to be(15)
    end
  end
end
