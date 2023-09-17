class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to books_path
    else
    render :new
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
       redirect_to book_path(@book.id)
    else
       render "edit"
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  # 投稿データのストロングパラメータ
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
