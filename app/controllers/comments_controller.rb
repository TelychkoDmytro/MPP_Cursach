class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @hoby = Hoby.find(params[:hoby_id])
    @post = @hoby.posts.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to hoby_post_path(@hoby, @post)
    else
      redirect_to hoby_post_path(@hoby, @post), alert: 'Comment cannot be blank.'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to hoby_post_path(params[:hoby_id], params[:post_id]), notice: 'Comment was successfully deleted.'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
