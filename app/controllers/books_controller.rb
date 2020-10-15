class BooksController < ApplicationController

  def index
  	@books = Book.all
    @new_book = new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to show_books_path(book.id), notice: "Book was successfully created."
    else
      redirect_to show_books_path(book.id), alert: "Book was failure to created."
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to show_books_path(book.id), notice: "Book was successfully updated."
    else
      redirect_to show_books_path(book.id), alert: "Book was failure to updated."
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      redirect_to index_books_path, notice: "Book was successfully destroyed."
    else
      redirect_to index_books_path, alert: "Book was failure to destroyed."
    end
  end

  private
  def new
    Book.new
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end