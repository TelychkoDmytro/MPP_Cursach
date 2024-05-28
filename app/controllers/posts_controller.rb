class PostsController < ApplicationController
	before_action :set_hoby
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def edit
		@types = Type.all
	end

	def update
		if @post.update(post_params)
			redirect_to [@hoby, @post], notice: t('post.success_edit')
		else
			render :edit
		end
	end

	def new
		@post = Post.new
		@users = User.all
		@hoby = Hoby.find(params[:hoby_id])
		@types = Type.all
	end

	def create
		@post = Post.new(post_params)
		# @post = @hoby.posts_build(post_params)
		if @post.save
			redirect_to [@hoby, @post], notice: t('post.success_creation')
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
		@comments = @post.comments.includes(:user)
	end

	private

	def set_hoby
		@hoby = Hoby.find(params[:hoby_id])
	end

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:annotation, :description, :user_id, :hoby_id, :type_id, images: [])
	end
end
