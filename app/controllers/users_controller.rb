class UsersController < ApplicationController

  def index
  	@user = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	@user.save

	  if @user.save
	  	byebug
	    redirect_to profile_path
	  else
	    render 'new'
	  end
	end

	def new
		@user = User.new
	end

	def update
  @user = User.find(params[:id])
 
	  if @user.update(article_params)
	    redirect_to @user
	  else
	    render 'edit'
	  end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy method: :delete

		redirect_to users_path
	end

	def profile
		@user = current_user
	end

  private

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :description)
  end
end
