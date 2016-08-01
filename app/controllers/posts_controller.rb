class PostsController < ApplicationController
	def index
		@post = Post.all.order("created_at DESC")
	end

	def new
	end

	def create
		@post = Post.new(post_params)
		@post.save

		redirect_to @post
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		p @post = Post.find(params[:id])
  	    p @post.update(post_params)
  	    p "*" * 100
  		redirect_to post_path(@post)
	end 

	def destroy
		@post = Post.find(params[:id])
		@post.destroy()
		redirect_to(:root)
	end


	private

		def post_params
			params.require(:post).permit(:title, :body)
		end

end
