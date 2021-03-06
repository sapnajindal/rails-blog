class BlogsController < ApplicationController

  before_action :authenticate_user!
  before_action :get_blog,  only: [:edit, :update, :show, :destroy]

  def index
    @q = Blog.ransack(params[:q])
    @blogs = @q.result.paginate(page: params[:page], per_page: 2).order('created_at DESC')
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(get_params())
    if @blog.save
      redirect_to @blog, flash: {message: 'Blog Created Successfully!'}
    else
      render 'new'
    end

  end

  def update
    if @blog.update(get_params)
      redirect_to @blog, flash: {message: 'Blog updated Successfully!'}
    else
      render 'edit'
    end
  end

  def show
    @comment = Comment.new
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, flash: {message: 'Blog destroyed!'}
  end

  private
    def get_params
      params.require(:blog).permit(:title, :text)
    end
    def get_blog
      @blog = Blog.find(params[:id])
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
