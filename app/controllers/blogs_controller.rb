class BlogsController < ApplicationController
  http_basic_authenticate_with name: "sapna", password: "password", except: [:index, :show]

  def index
    @blogs = Blog.all()
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(get_params())
    if @blog.save
      redirect_to @blog
    else
      render 'new'
    end

  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update(get_params)
      redirect_to @blog
    else
      render 'edit'
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    redirect_to blogs_path
  end

  private
    def get_params
      params.require(:blog).permit(:title, :text)
    end
end
