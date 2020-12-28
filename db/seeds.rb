### Create Polls

poll = Poll.find_or_create_by(name: "January Poll")
(1..3).to_a.each do |i|
  poll.options.create(name: "Book #{i}")
end

poll = Poll.find_or_create_by(name: "February Poll")
(4..6).to_a.each do |i|
  poll.options.create(name: "Book #{i}")
end

poll = Poll.find_or_create_by(name: "March Poll")
(7..9).to_a.each do |i|
  poll.options.create(name: "Book #{i}")
end
