class ActivitiesController < ApplicationController
  def index
  	@activity = Activity.all
  end

  def show
  	@activity = activity.find(params[:id])
  end

  def edit
  	@activity = activity.find(params[:id])
  end

  def create
  	@activity = activity.new(user_params)

	  if @activity.save
	    redirect_to @activity
	  else
	    render 'new'
	  end
	end

	def new
		@activity = activity.new
	end

	def update
	  @activity = activity.find(params[:id])
 
	  if @activity.update(article_params)
	    redirect_to @activity
	  else
	    render 'edit'
	  end
	end

	def destroy
		@activity = activity.find(params[:id])
		@activity.destroy method: :delete

		redirect_to users_path
	end

  private

  def user_params
  	params.require(:activity).permit(:first_name, :last_name, :description)
  end
end

