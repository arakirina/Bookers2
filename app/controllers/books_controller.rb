class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user.id == current_user.id
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to book_path(@book)
   else
     render :edit
   end
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

  def destroy
    book = Book.find(params[:id])
    if book.user.id == current_user.id
      flash[:notice] = "Book was successfully destroyed."
      book.destroy
      redirect_to books_path
    else
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
