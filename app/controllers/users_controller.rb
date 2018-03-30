class UsersController < ApplicationController
before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@books = @user.books
		@book_new = Book.new
		@book = User.find(params[:id])
		@book1 = Book.new
	end

	def index
		@book_new = Book.new
		@users = User.all
		@user = current_user
		@book = Book.new
	end

	def edit
		if current_user.id.to_s == params[:id]
			@user = User.find(params[:id])
		else
			puts current_user.id.to_s
			puts params[:id]
			redirect_to root_path
		end
    end


	def update
		@user = User.find(params[:id])
		@user.update(user_params)
        redirect_to user_path(@user.id)

	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :image)

	end

end
