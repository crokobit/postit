class CommentsController < ApplicationController
  before_action :set_comment, only:[:vote_up, :vote_down]
  before_action :require_sign_in, only: [:create, :vote_up ,:vote_down]

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
      flash[:alert] = "fail! can not be blank!"
      redirect_to post_path(@post)
    end
  end

  def vote_up
    vote = @comment.vote_up(current_user)
    flash[:alert] = "already voted" unless vote.valid?
    redirect_to :back
  end

  def vote_down
    vote = @comment.vote_down(current_user) 
    flash[:alert] = "already voted" unless vote.valid?
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
