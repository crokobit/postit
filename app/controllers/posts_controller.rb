class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show]

  def index
    @posts = PostDecorator.decorate_collection(Post.all)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
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

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:url, :title, :description)
  end
end
