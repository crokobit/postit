class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :vote_up, :vote_down]

  def index
    @posts = PostDecorator.decorate_collection(Post.all)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      @post.creator = current_user
      @post.save

      redirect_to posts_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = CommentDecorator.decorate_collection(@post.comments)
  end

  def vote_up
    @post.vote_up
    redirect_to :back
  end

  def vote_down
    @post.vote_down  
    redirect_to :back
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:url, :title, :description)
  end
end
