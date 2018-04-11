class PostsController < ApplicationController
  def new

  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    # binding.pry
    @post = Post.find(params[:id])
    # @post = @post.update(post_params)
    if @post.update(post_params)
      # @post = Post.find(params[:id])
      # @post.update(post_params)
      redirect_to post_path(@post)
    else
      # @post = Post.new( id: params[:id], 
      #                   title: post_params[:title],
      #                   category: post_params[:category],
      #                   content: post_params[:content] )
      # @post.valid?
      # binding.pry
      render :edit
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
