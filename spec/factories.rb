FactoryBot.define do
  factory :poll do
    sequence(:name) { |n| "Poll ##{n}" }
    active_starting_at { Date.yesterday }
    active_ending_at { Date.tomorrow }
  end

  factory :book do
    poll
    title { "Book A" }
    author { "Jill Jones" }
    link { "www.example.com" }
  end

  factory :user do
    first_name { "Betty" }
    last_name { "Boop" }
    email { "betty@boop.com" }
    password { "password99" }
  end

  factory :user_book_vote
end
