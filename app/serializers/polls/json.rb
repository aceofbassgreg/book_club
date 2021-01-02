module Polls
  class Json

    def call(polls)
      polls.sort_by(&:active_ending_at).reverse
    end
  end
end
