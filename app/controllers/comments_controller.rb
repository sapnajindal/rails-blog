class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_blog

  def create
    @comment = @blog.comments.new(comment_params)
    if @blog.save
      redirect_to @blog
    else
      render 'blogs/show'
    end
  end

  def destroy
    @comment = @blog.comments.find(params[:id])
    @comment.destroy
    redirect_to @blog
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
    def get_blog
      @blog = Blog.find(params[:blog_id])
    end
end
