class BooksController < ApplicationController
  before_action :set_book, only: :destroy
  #this controller is for getting all the books
  def index
    @books = Book.all
    render json:{success: true, data:@books}
  end
  #this controller is for creating a new book
  def create
    @book = Book.create(book_params)
    if @book.save
      render json:{success: true, data:@book}, status: :created
    else
      render json:{success: false, data:@book.errors}, status: :unprocessable_entity
    end
  end
  #this controller is for deleting a specific book
  def destroy
    @book.destroy
    head :no_content
  end

  private

  def book_params
    params.permit(:title,:author,:category_id)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
