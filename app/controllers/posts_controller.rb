class PostsController < ApplicationController
	before_action :find_doc, only: [:update, :destroy, :edit, :show]
	
	def index
		#@posts=Post.where(user_id: current_user).order("created_at DESC")
		@posts = if params[:term] 
					Post.where('title LIKE :title1 OR body LIKE :body1',{:title1 => "%#{params[:term]}%", :body1 => "%#{params[:term]}%"}).all.order("updated_at DESC")
				else
					Post.all.order("updated_at DESC")
				end
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
		if params[:image].blank?
			@post.image=nil
			@post.save
			if @post.update(post_params)
				redirect_to @post
			else
				render 'edit'
			end

		else
			if @post.update(post_params)
				redirect_to @post
			else
				render 'edit'
			end
		end
	end

	def show
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	def tech
		@posts= Post.where(category: "tech").all.order("updated_at DESC")
	end

	def programming
		@posts= Post.where(category: "prog").all.order("updated_at DESC")
	end

	def culture
		@posts= Post.where(category: "culture").all.order("updated_at DESC")
	end

	def education
		@posts= Post.where(category: "edu").all.order("updated_at DESC")
	end

	def politics
		@posts= Post.where(category: "Politics").all.order("updated_at DESC")
	end

	def entertainment
		@posts= Post.where(category: "Entertainment").all.order("updated_at DESC")
	end

	def sport
		@posts= Post.where(category: "Sports").all.order("updated_at DESC")
	end

	def product
		@posts= Post.where(category: "Product").all.order("updated_at DESC")
	end

	def pd
		@posts= Post.where(category: "pd").all.order("updated_at DESC")
	end

	def other
		@posts= Post.where(category: "other").all.order("updated_at DESC")		
	end

	def myposts
		@posts= Post.where(user_id: current_user.id).all.order("updated_at DESC")
	end


	private
		def find_doc
			@post = Post.find(params[:id])
		end

		def post_params
			params.require(:post).permit(:title,:body,:image,:category,:term,:spam)
		end

		

end
