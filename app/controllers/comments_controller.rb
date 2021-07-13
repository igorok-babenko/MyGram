class CommentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post

    @comment.save!
    redirect_to user_post_path(@user, @post)
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(@user, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
