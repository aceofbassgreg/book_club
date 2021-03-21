class BooksController < ApplicationController
  def index
    @books = serialized_books(Book.all_not_in_poll)
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

  private

  def book_params
    params.require(:books).map do |book|
      book.permit(%i[title author link])
    end
  end

  def serialized_books(books)
    books.group_by(:user_id)
  end
end
