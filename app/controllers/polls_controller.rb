class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new
    @poll.options.build
  end

  def create
    Poll.create(poll_params)
    @polls = Poll.all
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
    params.require(:poll).permit(:name, options_attributes: %i[title author link])
  end
end
