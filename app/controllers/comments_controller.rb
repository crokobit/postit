class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)

    if @comment.save
      #need refactor
      @comment.post = @post
      @comment.creator = current_user
      @comment.save

      flash[:notice] = "comment success"
      redirect_to post_path(@comment.post)
    else
      flash[:alert] = "fail"
      redirect_to post_path(@post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
