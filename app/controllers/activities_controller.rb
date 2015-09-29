class ActivitiesController < ApplicationController
	before_action :find_activity, only: [:show, :edit, :update, :destroy]
  def index
  	@activity = Activity.all
  end

  def show

  end

  def edit

  end

  def create
  	@activity = Activity.new(user_params)

	  if @activity.save
	    redirect_to @activity
	  else
	    render 'new'
	  end
	end

	def new
		@activity = Activity.new
	end

	def update

 
	  if @activity.update(article_params)
	    redirect_to @activity
	  else
	    render 'edit'
	  end
	end

	def destroy
		@activity.destroy method: :delete

		redirect_to users_path
	end

  private

  def user_params
  	params.require(:activity).permit(:first_name, :last_name, :description)
  end

  def find_activity
  	@activity = Activity.find(params[:id])
  end
end

