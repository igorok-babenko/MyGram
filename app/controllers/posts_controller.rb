class PostsController < ApplicationController
  #READ
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  #CREATE
  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to post, flash: {success: "Post was added"}
    else
      render :new, flash: {alert: "Some error occured"}
    end
  end

  #UPDATE
  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post, flash: {success: "Post was updated"}
  end

  #DESTROY
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to action: :index
  end

  private

  def post_params
    params.require(:post).permit(:content, :likes)
  end
end
