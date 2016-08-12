class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new(comment_params)
    @blog.save
    render 'blogs/show'
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.find(params[:id])
    @comment.destroy
    redirect_to @blog
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
