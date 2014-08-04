class CommentsController < ApplicationController
  before_action :set_comment

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

  def vote_up
    @comment.vote_up
    redirect_to :back
  end

  def vote_down
    @comment.vote_down  
    redirect_to :back
  end


  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
