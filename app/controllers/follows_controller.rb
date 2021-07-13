class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    follower_user = current_user
    following_user = User.find(params[:following_id])

    Follow.create(follower: follower_user, following: following_user)

    redirect_to user_path(following_user)
  end

  def destroy
    @user = User.find(params[:id])
    @follow = Follow.find_by(following_id: @user.id, follower_id: current_user.id).id
    Follow.destroy(@follow)

    redirect_to user_path(@user)
  end
end
