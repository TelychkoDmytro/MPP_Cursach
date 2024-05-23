class PostsController < ApplicationController
	def new
		@post = Post.new
		@users = User.all
		@hoby = Hoby.find(params[:hoby_id])
		@types = Type.all
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post, notice: 'Post was successfully created.'
		else
			@users = User.all
			@hobies = Hoby.all
			@types = Type.all
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
		@hoby = @post.hoby
	end

	private

	def post_params
		params.require(:post).permit(:annotation, :description, :user_id, :hoby_id, :type_id, images: [])
	end
end
