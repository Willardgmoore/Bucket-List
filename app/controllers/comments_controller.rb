class CommentsController < ApplicationController
  def index
  	@comments = Comment.all
  end

  def show
  	@comment = Comment.find(params[:id])
  end

  def edit
  	@comment = Comment.find(params[:id])
  end

  def create
  	@comment = Comment.new(user_params)

	  if @comment.save
	    redirect_to @comment
	  else
	    render 'new'
	  end
	end

	def new
		@comment = Comment.new
	end

	def update
	  @comment = Comment.find(params[:id])
 
	  if @comment.update(article_params)
	    redirect_to @comment
	  else
	    render 'edit'
	  end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy method: :delete

		redirect_to users_path
	end

  private

  def user_params
  	params.require(:comment).permit(:first_name, :last_name, :description)
  end
end

