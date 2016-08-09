class CommentsController < ApplicationController
  http_basic_authenticate_with name: "sapna", password: "password", only: :destroy

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create(comment_params)
    redirect_to @blog
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
