class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    if Post.new(post_params).valid?
      @post = Post.find(params[:id])
      @post.update(post_params)
      redirect_to post_path(@post)
    else
      @post = Post.find(params[:id])
      @post.update(post_params)
      render :edit
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
