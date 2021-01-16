class PollsController < ApplicationController
  def index
    @polls = serialized_polls
  end

  def new
    @poll = Poll.new
    @poll.books.build
  end

  def create
    Poll.create(poll_params)
    @polls = serialized_polls
    render :index
  end

  def edit
    @poll = Poll.find(poll_params[:id])
  end

  def show
    @poll = Poll.find(params[:id])
    @poll.books.each { |b| b.user_book_votes.build(user_id: params[:user_id]) }
  end

  def update
    @poll = Poll.find(params[:id])
    @user_book_votes = @poll.build(:user_)
  end

  def destroy
  end

  private

  def poll_params
    params.require(:poll).permit(
      :name, :active_starting_at, :active_ending_at,
        books_attributes: %i[title author link],
        user_book_votes: %i[score]
    )
  end

  def serialized_polls
    Polls::Json.new.(Poll.all)
  end
end
