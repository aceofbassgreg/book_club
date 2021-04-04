class BooksController < ApplicationController
  def index
    @books = Book.all_not_in_poll
    @event = Event.new
  end

  def new
    @book = Book.new
  end

  def create
    @books = Book.create(book_params.map { |p| p.merge(user_id: current_user.id) })
    if @books.all?(&:valid?)
      flash.notice = 'Books added successfully.'
      redirect_to books_url
    else
      flash.alert = "Books did not create successfully: #{@book.errors.full_messages.to_sentence}."
      render action: :new
    end
  end

  def destroy
    result = Book.find(params[:id]).destroy
    if result
      flash.notice = 'Book deleted successfully.'
      redirect_to books_url
    else
      flash.alert = 'Book was not removed.'
    end
  end

  private

  def book_params
    params.require(:books).map do |book|
      book.permit(%i[title author link])
    end
  end
end
