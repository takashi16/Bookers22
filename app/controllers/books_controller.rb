class BooksController < ApplicationController
    before_action :authenticate_user!
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
    	@book1 = Book.new(book_params)
        @book1.user_id = current_user.id
        if @book1.save
            redirect_to user_path(current_user.id)
        else
        @user = User.find(current_user.id)
        @books = @user.books
        @book_new = Book.new
        @book = User.find(current_user.id)
            render("/users/show")
        end
    end


    def edit
    if current_user.id == Book.find(params[:id]).user_id
        @book = Book.find(params[:id])
    else
        redirect_to root_path
    end
    	
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
