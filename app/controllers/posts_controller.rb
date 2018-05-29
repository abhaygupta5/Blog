class PostsController < ApplicationController
	before_action :find_doc, only: [:update, :show, :destroy, :edit]

	def index
		@posts=Post.where(user_id: current_user).order("created_at DESC")
	end

	def new
		@post=current_user.posts.build
	end

	def create
		@post=current_user.posts.build(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def show
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	private
		def find_doc
			@post = Post.find(params[:id])
		end

		def post_params
			params.require(:post).permit(:title,:body,:image)
		end




end
