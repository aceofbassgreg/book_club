class PollsController < ApplicationController
  def index
    @polls = serialized_polls
  end

  def new
    @poll = Poll.new
    @poll.options.build
  end

  def create
    Poll.create(poll_params)
    @polls = serialized_polls
    render :index
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def poll_params
    params.require(:poll).permit(
      :name, :active_starting_at, :active_ending_at, options_attributes: %i[title author link]
    )
  end

  def serialized_polls
    Polls::Json.new.(Poll.all)
  end
end
