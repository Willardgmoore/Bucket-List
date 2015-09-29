class CommentsController < ApplicationController
  def index
  	@comment = comment.all
  end

  def show
  	@comment = comment.find(params[:id])
  end

  def edit
  	@comment = comment.find(params[:id])
  end

  def create
  	@comment = comment.new(user_params)

	  if @comment.save
	    redirect_to @comment
	  else
	    render 'new'
	  end
	end

	def new
		@comment = comment.new
	end

	def update
	  @comment = comment.find(params[:id])
 
	  if @comment.update(article_params)
	    redirect_to @comment
	  else
	    render 'edit'
	  end
	end

	def destroy
		@comment = comment.find(params[:id])
		@comment.destroy method: :delete

		redirect_to users_path
	end

  private

  def user_params
  	params.require(:comment).permit(:first_name, :last_name, :description)
  end
end

