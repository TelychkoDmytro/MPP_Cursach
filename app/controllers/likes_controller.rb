class LikesController < ApplicationController
	before_action :find_like, only: [:destroy]
	before_action :find_post

	def create
		if already_liked?
			flash[:notice] = "You can't like more than once"
		else
			@post.likes.create(user_id: current_user.id)
		end
		redirect_to hoby_post_path(@post.hoby_id, @post)
	end

	def destroy
		unless already_liked?
			flash[:notice] = "Cannot unlike"
			Rails.logger.info "CANNOT UNLIKE"
		else
			Rails.logger.info 'UNLIKED?'
			@like.destroy
		end
		redirect_to hoby_post_path(@post)
	end

	private

	def find_post
		@post = Post.find(params[:post_id])
	end

	def find_like
		@post = Post.find(params[:post_id])
		@like = @post.likes.find(params[:id])
	end

	def already_liked?
		Like.where(user_id: current_user.id, post_id:
			params[:post_id]).exists?
	end
end