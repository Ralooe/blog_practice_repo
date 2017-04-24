class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	def index
	end

	def new
		@posts = Post.new
	end

	def create
		@posts = Post.new post_params

		if @posts.save
			redirect_to @posts, notice:"you did it"
		else
			render 'new', notice:"couldnt save"
		end
	end

	def show
		
	end

	def edit
	end

	def update
		if @posts.update post_params
			redirect_to @posts, notice: "article updated"
		else 
			render 'edit'	
		end
	end

	def destroy
		@posts.destroy
		redirect_to posts_path
	end


	private

	def post_params
		params.require(:post).permit(:title, :content)
	end

	def find_post
		@posts = Post.find(params[:id])
	end

end
