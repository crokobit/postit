class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)

    if @comment.save
      #need refactor
      @comment.post = @post
      @comment.creator = User.first
      @comment.save
      flash[:notice] = "comment success"
      redirect_to post_path(@comment.post)
    else
      flash[:alert] = "fail"
      render :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
