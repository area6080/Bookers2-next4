class BooksController < ApplicationController

  def new
    @user = User.find(params[:id])
    @book = Book.new
  end

  def index
    @users = User.all
    # @books = @user.books.all
  end

  def show
    @user = current_user
    @book = @user.books.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @book = @user.books.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    book = @user.books.find(params[:id])
    book.destroy
    redirect_to books_path(@user.id)
  end

  def update

  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end

