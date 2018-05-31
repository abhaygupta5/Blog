class CommentsController < ApplicationController
	def index
	end

	def new
	end

	def create
		@post=Post.find(params[:post_id])
		@comment=@post.comments.create(params[:comment].permit(:body))
		@comment.user_id = current_user.id
		@comment.save
		redirect_to post_path(@post)
	end

	def edit
	end

	def update
	end

	def show
	end

	def destroy
		@post=Post.find(params[:post_id])
		@comment=@post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	
end
