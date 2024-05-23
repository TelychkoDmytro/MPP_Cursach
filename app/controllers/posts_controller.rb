class PostsController < ApplicationController
	def show
		@post = Post.find(params[:id])
		@hoby = @post.hoby
	end
end
