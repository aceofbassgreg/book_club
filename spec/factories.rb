FactoryBot.define do
  factory :poll do
    name { "January 2020" }
  end

  factory :option do
    poll
    name { "Book A" }
    author { "Jill Jones" }
    link { "www.example.com" }
  end

  factory :user do
    first_name { "Betty" }
    last_name { "Boop" }
    email { "betty@boop.com" }
  end

  factory :user_option
end
