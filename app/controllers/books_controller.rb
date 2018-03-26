class BooksController < ApplicationController

	def new
		@books = User.all
	end

	def index
		@users = User.all
		@book = Book.new
		@books = Book.all
        @user = current_user


	end

	def show
		@showbook = Book.find(params[:id])
        @user = @showbook.user
		@book = Book.new
	end

	def create
    	book = Book.new(book_params)
        book.user_id = current_user.id
        book.save
        redirect_to user_path(current_user.id)
    end


    def edit
    	@book = Book.find(params[:id])
    end


    def update
    	book = Book.find(params[:id])
    	book.update(book_params)
    	redirect_to book_path(book)
    end


    def destroy
    	@book = Book.find(params[:id])
    	@book.destroy
    	redirect_to books_path
    end


    private

	def book_params
        params.require(:book).permit(:title, :body, :user_id)
    end
end
