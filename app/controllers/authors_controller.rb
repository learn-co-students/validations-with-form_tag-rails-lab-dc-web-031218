class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.create(author_params)

    redirect_to author_path(@author)
  end

  def edit
  end

  def create # define valid path & invalid path
     @author = Author.create({name: params[:name], email: params[:email], phone_number: params[:phone_number]})
    if @author.valid? 
      @author.save
      redirect_to author_path(@author)
    else 
      render :new
    end
  end 

  def update #define valid path & invalid path
     @author = Author.find(params[:id])
    if @author.valid? 
      @author.update(post_params)
      redirect_to author_path(@author)
    else 
      render :edit 
    end
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
