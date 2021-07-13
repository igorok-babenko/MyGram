class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    liked_user = current_user

    Like.create(user_id: liked_user.id, post_id: @post.id)

    redirect_to user_post_path(@user, @post)
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    liked_user = current_user
    @like = Like.find_by(post_id: @post.id, user_id: liked_user.id).id
    Like.destroy(@like)

    redirect_to user_post_path(@user, @post)
  end
end