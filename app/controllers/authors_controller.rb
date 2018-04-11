class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    temp = Author.new(author_params)
    if temp.valid?
      @author = Author.create(author_params)
      redirect_to author_path(@author)
    else
      @author = temp
      render :new
    end
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
