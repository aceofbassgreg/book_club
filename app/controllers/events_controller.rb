class EventsController < ApplicationController
  def index
    @events = serialized_events
  end

  def new
    @event = Event.new
    @poll = @event.polls.build
    @books = books_from_params
    @book = @poll.books.build
  end

  def create
    unless event_params['polls_attributes']['0']['books_attributes']
      flash.alert = 'Event creation failed, books must be added to create a poll.'
      render action: :new
      return
    end

    @event = Event.create(event_params)

    if @event.valid?
      flash.notice = 'Event created successfully.'
      redirect_to events_url
    else
      flash.alert = "Event did not create successfully: #{@event.errors.full_messages.to_sentence}."
      render action: :new
    end
  end

  def destroy
    result = Event.find(params[:id]).destroy
    if result
      flash.notice = 'Event deleted successfully.'
      redirect_to events_url
    else
      flash.alert = 'Event was not removed.'
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :id,
      polls_attributes: [
        :active_starting_at,
        :active_ending_at,
        :poll_type,
        { books_attributes: %i[title author link] }
      ]
    )
  end

  def serialized_events
    Events::Json.new.(Event.all).sort.reverse
  end

  def books_from_params
    book_ids = params[:book_id]&.keys
    Book.find(book_ids) if book_ids
  end
end
