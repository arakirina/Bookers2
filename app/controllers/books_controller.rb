class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @books = Book.all
    @user = @book.user
    
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
