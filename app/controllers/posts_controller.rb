class PostsController < ApplicationController
  before_action :load_user
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  #READ
  def index
    @posts = @user.posts
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  #CREATE
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = @user
    if @post.save
      redirect_to user_post_path(@user, @post), flash: {success: "Post was added"}
    else
      render :new, flash: {alert: "Some error occured"}
    end
  end

  #UPDATE
  def edit
    @post = @user.posts.find(params[:id])
  end

  def update
    @post = @user.posts.find(params[:id])
    @post.update(post_params)
    redirect_to user_post_path(@user, @post), flash: {success: "Post was updated"}
  end

  #DESTROY
  def destroy
    @post = @user.posts.find(params[:id])
    @post.destroy

    redirect_to action: :index
  end

  private

  def post_params
    params.require(:post).permit(:content, :likes, :image)
  end

  def load_user
    @user = User.find(params[:user_id])
  end
end
