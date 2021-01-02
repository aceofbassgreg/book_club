### Create Polls

poll = Poll.find_or_create_by(name: "January Poll", active_starting_at: Date.yesterday - 50000, active_ending_at: Date.yesterday)
(1..3).to_a.each do |i|
  poll.options.create(title: "Book #{i}", author: "Dr. Seuss")
end

poll = Poll.find_or_create_by(name: "February Poll", active_starting_at: Date.yesterday - 5000, active_ending_at: Date.yesterday)

(4..6).to_a.each do |i|
  poll.options.create(title: "Book #{i}", author: "Dr. Seuss")
end

poll = Poll.find_or_create_by(name: "March Poll", active_starting_at: Date.yesterday, active_ending_at: Date.tomorrow + 50000)

(7..9).to_a.each do |i|
  poll.options.create(title: "Book #{i}", author: "Dr. Seuss")
end
