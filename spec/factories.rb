FactoryBot.define do
  factory :post do
    name
  end

  factory :option do
    post
    name
    author
    link
    poll
  end

  factory :user do
    first_name
    last_name
    email
  end
end
