class BooksController < ApplicationController
  def index
    @books = Book.all
    render json:{success: true, data:@books}
  end
end
