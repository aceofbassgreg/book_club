class PollsController < ApplicationController
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
    @poll = Poll.find(params[:id])
    @poll.books.map { |b| b.user_book_votes.build }
  end

  def update
    # {"user_book_votes"=>#<ActionController::Parameters {"7"=>#<ActionController::Parameters {"score"=>"20", "book_id"=>"7"} permitted: true>, "8"=>#<ActionController::Parameters {"score"=>"1", "book_id"=>"8"} permitted: true>, "9"=>#<ActionController::Parameters {"score"=>"15", "book_id"=>"9"} permitted: true>} permitted: true>}
    @poll = Poll.find(params[:id])
    poll_params.dig("user_book_votes").each do |book_id, h|
      UserBookVote.create!(
        score: h[:score],
        book_id: book_id,
        user_id: session[:current_user_id]
      )
    end

    redirect_to events_url
  end

  def destroy
  end

  private

  def poll_params
    params.require(:poll).permit(
      :active_starting_at, :active_ending_at, books_attributes: %i[title author link], user_book_votes: %i[score book_id]
    )
  end
end
