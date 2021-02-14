### Create Polls
nov_event = Event.find_or_create_by(name: 'November 2020 Poll')
nov_book_poll = nov_event.polls.create(
  active_starting_at: Time.new(2020, 10, 1),
  active_ending_at: Time.new(2020, 10, 16),
  poll_type: :book
)
nov_book_poll.books.create(
  title: 'The City We Became',
  author: 'N.K. Jemison',
  link: 'https://openlibrary.org/works/OL20656799W/The_City_We_Became'
)
nov_book_poll.books.create(
  title: 'Blood Meridian',
  author: 'Cormac McCarthy',
  link: 'https://openlibrary.org/works/OL40879W/Blood_Meridian_or_the_Evening_Redness_in_the_West')
nov_book_poll.books.create(
  title: 'Pride and Prejudice',
  author: 'Jane Austen',
  link: 'https://openlibrary.org/works/OL9039929W/Pride_and_Prejudice'
)
dec_event = Event.find_or_create_by(name: 'December 2020 Poll')
dec_book_poll = dec_event.polls.create(
  active_starting_at: Time.new(2020, 12, 1),
  active_ending_at: Time.new(2020, 12, 14),
  poll_type: :book
)

dec_book_poll.books.create(
  title: 'Braiding Sweetgrass',
  author: 'Robin Wall Kimmerer',
  link: 'https://openlibrary.org/works/OL17848523W/Braiding_sweetgrass'
)
dec_book_poll.books.create(
  title: 'Infinite Jest',
  author: 'David Foster Wallace',
  link: 'https://openlibrary.org/works/OL2943602W/Infinite_jest'
)

next_event = Event.find_or_create_by(name: 'Next month meet-up')
current_book_poll = next_event.polls.create(
  active_starting_at: Time.now,
  active_ending_at: Time.now + 1_000_000,
  poll_type: :book
)

current_book_poll.books.create(
  title: 'Florida',
  author: 'Lauren Groff',
  link: 'https://openlibrary.org/works/OL19748408W/Florida'
)

current_book_poll.books.create(
  title: "Gravity's Rainbow",
  author: 'Thomas Pynchon',
  link: 'https://openlibrary.org/works/OL2636675W/Gravity%27s_Rainbow'
)

current_book_poll.books.create(
  title: 'Frankenstein',
  author: 'Mary Shelley',
  link: 'https://openlibrary.org/works/OL450125W/Frankenstein'
)

current_book_poll.books.create(
  title: 'The Sound and The Fury',
  author: 'William Faulkner',
  link: 'https://openlibrary.org/works/OL82870W/The_Sound_and_the_Fury'
)

### Create Admin User
User.find_or_create_by(
  email: 'gk@gk.com',
  first_name: 'Greg',
  last_name: 'Kenenitz',
  admin: true
).update(
  password: 'password99'
)
