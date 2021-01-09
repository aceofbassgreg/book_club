require "rails_helper"

describe Poll do
  let(:poll) { create(:poll, name: "January 2021") }

  describe "#book_score" do
    let(:iliad) { create(:book, title: "The Iliad", poll: poll) }
    let(:odyssey) { create(:book, title: "The Odyssey", poll: poll) }

    let(:betty) do
      create(:user, first_name: "Betty", last_name: "Boop", email: "betty@boop.com")
    end

    let(:liz) do
      create(:user, first_name: "Liz", last_name: "Loop", email: "liz@loop.com")
    end

    it "calculates the total for a given poll option" do
      create(:user_book_vote, user: liz, book: odyssey, score: 8)
      create(:user_book_vote, user: betty, book: odyssey, score: 7)

      create(:user_book_vote, user: liz, book: iliad, score: 2)

      expect(poll.book_score(odyssey.id)).to be(15)
    end
  end
end
