class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end
  def new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update # define valid path & invalid path
    @post = Post.find(params[:id])
      @post.update(post_params)
    if @post.valid?
      redirect_to post_path(@post)
    else 
      render :edit 
    end
  end

 def create # define valid path & invalid path
    @post = Post.create({title: params[:title], content: params[:content], category: params[:category]})
   if @post.valid? 
    @post.save
    redirect_to post_path(@post)
    else 
      render :new
    end
  end 

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
