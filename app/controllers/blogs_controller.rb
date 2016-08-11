class BlogsController < ApplicationController

  before_action :authenticate_user!

  def index
    a
    @blogs = Blog.all
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
    @error = flash[:error]
    @comment = Comment.new
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

    # testing binding of caller gem
    def a
      var = 10
      b
      puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
      puts var
    end

    def b
      c
    end

    def c
      binding.of_caller(2).eval('var = :hello')
    end

end
