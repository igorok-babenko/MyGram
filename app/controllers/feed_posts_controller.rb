class FeedPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user

  def index
    if @user.followings.exists?
      @posts = Post.where(user_id: @user.followings.pluck(:id)).order(created_at: :desc)
    else
      @posts = Post.none
    end

    render 'feed_posts/index'
  end

  def load_user
    @user = User.find(params[:user_id])
  end
end