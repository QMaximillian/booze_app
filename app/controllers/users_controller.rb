class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		byebug
		@user = User.new(user_params)

		if @user.save
			redirect_to users_path
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def index

	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password_digest)
	end
end

