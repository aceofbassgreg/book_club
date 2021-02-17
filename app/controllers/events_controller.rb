class EventsController < ApplicationController
  def index
    @events = serialized_events
  end

  def new
    @event = Event.new
    @poll = @event.polls.build
    @book = @poll.books.build
  end

  def create
    Event.create!(event_params)

    redirect_to events_url
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      polls_attributes: [
        :active_starting_at,
        :active_ending_at,
        :poll_type,
        { books_attributes: %i[title author link] }
      ]
    )
  end

  def serialized_events
    Events::Json.new.(Event.all)
  end
end
