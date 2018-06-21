class PostsController < ApplicationController
	before_action :find_doc, only: [:update, :destroy, :edit, :show]
	
	def index
		#@posts=Post.where(user_id: current_user).order("created_at DESC")
		@posts = if params[:term] 
					Post.joins(:user).where('title LIKE :title1 OR body LIKE :body1 OR name LIKE :name1 OR email LIKE :email1',{:title1 => "%#{params[:term]}%", :body1 => "%#{params[:term]}%", :name1 => "%#{params[:term]}%", :email1 => "%#{params[:term]}%"}).all.order("updated_at DESC").paginate(:page=> params[:page], :per_page=> 5)
				else
					Post.all.order("updated_at DESC").paginate(:page=> params[:page], :per_page=> 5)
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
		redirect_to root_path
	end

	def tech
		@posts= Post.where(category: "tech").all.order("updated_at DESC").paginate(:page=> params[:page], :per_page=> 5)
	end

	def programming
		@posts= Post.where(category: "prog").all.order("updated_at DESC").paginate(:page=> params[:page], :per_page=> 5)
	end

	def culture
		@posts= Post.where(category: "culture").all.order("updated_at DESC").paginate(:page=> params[:page], :per_page=> 5)
	end

	

	def politics
		@posts= Post.where(category: "Politics").all.order("updated_at DESC").paginate(:page=> params[:page], :per_page=> 5)
	end

	def entertainment
		@posts= Post.where(category: "Entertainment").all.order("updated_at DESC").paginate(:page=> params[:page], :per_page=> 5)
	end

	def sport
		@posts= Post.where(category: "Sports").all.order("updated_at DESC").paginate(:page=> params[:page], :per_page=> 5)
	end

	def product
		@posts= Post.where(category: "Product").all.order("updated_at DESC").paginate(:page=> params[:page], :per_page=> 5)
	end

	

	def other
		@posts= Post.where(category: "Other").all.order("updated_at DESC").paginate(:page=> params[:page], :per_page=> 5)		
	end

	def myposts
		@posts= Post.where(user_id: current_user.id).all.order("updated_at DESC").paginate(:page=> params[:page], :per_page=> 5)
	end


	private
		def find_doc
			@post = Post.find(params[:id])
		end

		def post_params
			params.require(:post).permit(:title,:body,:image,:category,:term,:spam)
		end

		

end
