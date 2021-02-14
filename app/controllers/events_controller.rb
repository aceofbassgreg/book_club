class EventsController < ApplicationController
  def index
    @events = serialized_events
  end

  private

  def serialized_events
    Events::Json.new.(Event.all)
  end
end
