class BooksController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
  	@books = Book.joins(:user) 
    @new_book = Book.new
  end

  def show
    begin
      @book = Book.find(params[:id])
      @target_user = User.find(@book.user_id)
    rescue
      redirect_to books_path
    end

    @new_book = Book.new
  end

  def create
    @new_book = Book.new(book_params)
    if @new_book.save
      redirect_to book_path(@new_book.id), notice: "You have creatad book successfully."
    else
      if @books.nil?
        @books = Book.joins(:user)
      end
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      redirect_to books_path
    else
      redirect_to books_path, alert: "Book was failure to destroyed."
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  def correct_user
    begin
      book = Book.find(params[:id])
      user = User.find(book.user_id)
    rescue
      redirect_to books_path
    end

    if user.id != current_user.id
      redirect_to books_path
    end
  end
end